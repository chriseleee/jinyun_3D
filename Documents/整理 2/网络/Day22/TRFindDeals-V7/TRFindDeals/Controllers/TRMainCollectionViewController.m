//
//  TRMainCollectionViewController.m
//  TRFindDeals
//
//  Created by tarena on 15/9/22.
//  Copyright (c) 2015年 tarena. All righ·ts reserved.
//

#import "TRMainCollectionViewController.h"
#import "UIBarButtonItem+TRBarButtonItem.h"
#import "TRNavLeftView.h"
#import "TRCategoryViewController.h"
#import "TRRegionViewController.h"
#import "TRSortViewController.h"
#import "TRCity.h"
#import "TRRegion.h"
#import "TRCategory.h"
#import "DPAPI.h"
#import "TRSort.h"
#import "TRDeal.h"
#import "TRMapViewController.h"
#import "TRNavViewController.h"
#import "UIScrollView+BottomRefreshControl.h"
#import "TRDetailViewController.h"
#import "TRSearchViewController.h"

@interface TRMainCollectionViewController ()<DPRequestDelegate>

//分类弹出控制器
@property (nonatomic, strong) UIPopoverController *categoryPopController;

//区域弹出控制器
@property (nonatomic, strong) UIPopoverController *regionPopController;

//排序弹出控制器
@property (nonatomic, strong) UIPopoverController *sortPopController;

//分类视图
@property (nonatomic, strong) TRNavLeftView *categoryView;
//区域视图
@property (nonatomic,strong) TRNavLeftView *regionView;
//排序视图
@property (nonatomic, strong) TRNavLeftView *sortView;

//设定用户选中的分类/城市/区域/排序
@property (nonatomic, strong) NSString *selectedCity;
@property (nonatomic, strong) NSString *selectedCategory;
@property (nonatomic, strong) NSString * selectedSubCategory;
@property (nonatomic, strong) NSString *selectedRegion;
@property (nonatomic, strong) NSString * selectedSubRegion;
@property (nonatomic, assign) int selectedSort;

//存储服务器返回的所有团购订单
@property (nonatomic, strong) NSMutableArray *dealsArray;

//请求的页数
@property (nonatomic, assign) int page;


@end

@implementation TRMainCollectionViewController

static NSString * const reuseIdentifier = @"Cell";


- (NSMutableArray *)dealsArray {
    if (!_dealsArray) {
        _dealsArray = [NSMutableArray array];
    }
    return _dealsArray;
}

- (UIPopoverController *)categoryPopController {
    if (!_categoryPopController) {
        TRCategoryViewController *categoryViewController = [[TRCategoryViewController alloc] init];
        _categoryPopController = [[UIPopoverController alloc] initWithContentViewController:categoryViewController];
    }
    return _categoryPopController;
}

- (UIPopoverController *)regionPopController {
    if (!_regionPopController) {
        TRRegionViewController *regionViewController = [TRRegionViewController new];
        _regionPopController = [[UIPopoverController alloc] initWithContentViewController:regionViewController];
    }
    return _regionPopController;
}

- (UIPopoverController *)sortPopController {
    if (!_sortPopController) {
        TRSortViewController *sortViewController = [TRSortViewController new];
        _sortPopController = [[UIPopoverController alloc] initWithContentViewController:sortViewController];
    }
    return _sortPopController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    //监听通知
    [self listenNotifications];
    
    //创建右边的两个items
    [self setupRightItems];
    
    //创建左边的四个items
    [self setupLeftItems];

}

- (void)listenNotifications {
    //城市
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityDidChange:) name:@"TRCityDidChange" object:nil];
    
    //区域/子区域
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(regionDidChange:) name:@"TRRegionDidChange" object:nil];
    
    //分类
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(categoryDidChange:) name:@"TRCategoryDidChange" object:nil];
    
    //排序方式
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sortDidChange:) name:@"TRSortDidChange" object:nil];
}

#pragma mark --- 监听通知的触发方法
- (void)cityDidChange:(NSNotification *)notification {
    self.selectedCity = notification.userInfo[@"TRSelectedCityName"];
    
}

- (void)regionDidChange:(NSNotification *)notification {
    TRRegion *region = notification.userInfo[@"TRSelectedRegion"];
    NSString *subRegionName = notification.userInfo[@"TRSelectedSubRegionName"];
    self.selectedRegion = region.name;
    self.selectedSubRegion = subRegionName;
    
    //赋值上面的regionView的控件的文本
    self.regionView.titleLabel.text = [NSString stringWithFormat:@"%@ -- %@", self.selectedCity, self.selectedRegion];
    self.regionView.subTitleLabel.text = self.selectedSubRegion;
    
    //1.收回弹出控制器(regionPopController)
    [self.regionPopController dismissPopoverAnimated:YES];
    
    //2.发送请求，获取服务器返回的所有团购订单数据
    [self loadNewDeals];
}

- (void)categoryDidChange:(NSNotification *)notification {
    //获取接收通知的参数，赋值给属性
    TRCategory *category = notification.userInfo[@"TRSelectedCategory"];
    NSString *subCategoryStr = notification.userInfo[@"TRSelectedSubCategoryStr"];
    self.selectedCategory = category.name;
    self.selectedSubCategory = subCategoryStr;
    
    //赋值上面的categoryView的控件的文本
    self.categoryView.titleLabel.text = self.selectedCategory;
    self.categoryView.subTitleLabel.text = self.selectedSubCategory;
    
    //设置图片
    [self.categoryView.imageButton setImage:[UIImage imageNamed:category.icon] forState:UIControlStateNormal];
    [self.categoryView.imageButton setImage:[UIImage imageNamed:category.highlighted_icon] forState:UIControlStateHighlighted];

    
    //收回弹出控制器
    [self.categoryPopController dismissPopoverAnimated:YES];
    
    //发送请求
    [self loadNewDeals];
}

- (void)sortDidChange:(NSNotification *)notification {
    TRSort *sort =  notification.userInfo[@"TRSelectedSort"];
    
    self.selectedSort = sort.value;//1,2,...7
    
    //赋值上面的sortView的控件的文本
    self.sortView.titleLabel.text = sort.label;
    self.sortView.subTitleLabel.text = @"排序";
    
    [self.sortPopController dismissPopoverAnimated:YES];
    [self loadNewDeals];
    
}

#pragma mark --- 创建navigation bar上的items
- (void)setupRightItems {
    //searchItem icon_search/icon_search_highlighted
    UIBarButtonItem *mapItem = [UIBarButtonItem itemWithImageName:@"icon_map" withHighlightedImageName:@"icon_map_highlighted" target:self withAction:@selector(clickMapButton)];
    UIBarButtonItem *searchItem = [UIBarButtonItem itemWithImageName:@"icon_search" withHighlightedImageName:@"icon_search_highlighted" target:self withAction:@selector(clickSearchButton)];
    
    self.navigationItem.rightBarButtonItems = @[mapItem, searchItem];
    
}

- (void)setupLeftItems {
    //创建四个items
    UIBarButtonItem *logoItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    //设置logo item不可点击
    logoItem.enabled = NO;
    
    //分类item
    self.categoryView = [TRNavLeftView view];
    //设置分类自定义视图中button的响应事件
    [self.categoryView.imageButton addTarget:self action:@selector(clickCategoryButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *categoryItem = [[UIBarButtonItem alloc] initWithCustomView:self.categoryView];
    
    //区域item
    self.regionView = [TRNavLeftView view];
    [self.regionView.imageButton addTarget:self action:@selector(clickRegionButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *regionItem = [[UIBarButtonItem alloc] initWithCustomView:self.regionView];
    
    //排序item
    self.sortView = [TRNavLeftView view];
    [self.sortView.imageButton addTarget:self action:@selector(clickSortButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *sortItem = [[UIBarButtonItem alloc] initWithCustomView:self.sortView];
    
    self.navigationItem.leftBarButtonItems = @[logoItem, categoryItem, regionItem, sortItem];
}

#pragma mark --- 点中左边item触发方法
- (void)clickCategoryButton {
    //如何显示分类弹出控制器(位置/显示的方向)
    /**
     第一个参数：相对于第二个参数的坐标(x,y,width,height)
     第二个参数：设定显示对应的视图
     第三参数：箭头从哪个方向来显示
     */
//    self.categoryView.backgroundColor = [UIColor redColor];
    [self.categoryPopController presentPopoverFromRect:self.categoryView.bounds inView:self.categoryView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)clickRegionButton {
    [self.regionPopController presentPopoverFromRect:self.regionView.bounds inView:self.regionView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}
- (void)clickSortButton {
    [self.sortPopController presentPopoverFromRect:self.sortView.bounds inView:self.sortView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

#pragma mark --- 点中右边item触发方法
- (void)clickMapButton {
    TRMapViewController *mapViewController = [TRMapViewController new];
    TRNavViewController *navViewController = [[TRNavViewController alloc] initWithRootViewController:mapViewController];
    
    //弹出地图视图控制器
    [self presentViewController:navViewController animated:YES completion:nil];
}

- (void)clickSearchButton {
    TRSearchViewController *searchViewController = [[TRSearchViewController alloc] init];
    
    if (self.selectedCity) {
        searchViewController.cityName = self.selectedCity;
    } else {
#warning TODO: 添加警告view
        searchViewController.cityName = @"北京";
    }
    
    TRNavViewController *navController = [[TRNavViewController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:navController animated:YES completion:nil];
    

    
}

#pragma mark - 实现父类提供的设置参数 方法
- (void)settingParams:(NSMutableDictionary *)params
{
    //必须传出城市参数
    if (self.selectedCity) {
        params[@"city"] = self.selectedCity;
    } else {
        //如果用户没有点城市, 给一个默认城市
        params[@"city"] = @"北京";
    }
    
    //分类
    if (self.selectedCategory && ![self.selectedCategory isEqualToString:@"全部分类"]) {
        //有子分类
        if (self.selectedSubCategory && ![self.selectedSubCategory isEqualToString:@"全部"]) {
            params[@"category"] = self.selectedSubCategory;
        } else {
            //没有子分类
            params[@"category"] = self.selectedCategory;
        }
    }
    
    //区域
    if (self.selectedRegion && ![self.selectedRegion isEqualToString:@"全部"]) {
        if (self.selectedSubRegion && ![self.selectedSubRegion isEqualToString:@"全部"]) {
            //有子区域
            params[@"region"] = self.selectedSubRegion;
        } else {
            //没有子区域
            params[@"region"] = self.selectedRegion;
        }
    }
    
    //排序
    if (self.selectedSort) {
        params[@"sort"] = @(self.selectedSort);
    }
}




@end
