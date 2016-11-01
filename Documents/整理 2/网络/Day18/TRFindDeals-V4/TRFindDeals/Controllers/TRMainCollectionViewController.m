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


@end

@implementation TRMainCollectionViewController

static NSString * const reuseIdentifier = @"Cell";


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
    
    //排序方式
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
    
    //1.收回弹出控制器(regionPopController)
    [self.regionPopController dismissPopoverAnimated:YES];
    
    //2.发送请求，获取服务器返回的所有团购订单数据
    [self loadNewDeals];
}

- (void)loadNewDeals {
    //1.创建api
    DPAPI *api = [[DPAPI alloc] init];
    
    //2.设置发送参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //城市(必选参数)
    params[@"city"] = self.selectedCity;
    if (self.selectedSubRegion.length == 0) {
        params[@"region"] = self.selectedRegion;
    } else {
        params[@"region"] = self.selectedSubRegion;
    }
    NSLog(@"发送的参数:%@", params);
    
    //3.发送请求
    [api requestWithURL:@"v1/deal/find_deals" params:params delegate:self];
}

#pragma mark --- dianPin delegate 
- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result {
    NSLog(@"result:%@", result);
    
}

- (void)request:(DPRequest *)request didFailWithError:(NSError *)error {
    NSLog(@"file");
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
    //
}

- (void)clickSearchButton {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
