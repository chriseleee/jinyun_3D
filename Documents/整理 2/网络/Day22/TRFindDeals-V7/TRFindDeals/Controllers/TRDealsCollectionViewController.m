//
//  TRDealsCollectionViewController.m
//  TRFindDeals
//
//  Created by Xiao on 15/10/7.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRDealsCollectionViewController.h"
#import "DPAPI.h"
#import "UIScrollView+BottomRefreshControl.h"
#import "TRDetailViewController.h"
#import "TRMetaDataTool.h"

#import "TRDeal.h"
#import "TRCollectionViewCell.h"


@interface TRDealsCollectionViewController ()

//解决上拉刷新问题
@property (nonatomic, strong) NSMutableArray *dealsArray;

//设置页数
@property (nonatomic, assign) int page;

@end

@implementation TRDealsCollectionViewController

static NSString * const reuseIdentifier = @"deal";

//使用懒加载方式对可变数据初始化
- (NSMutableArray *)dealsArray {
    if (!_dealsArray) {
        _dealsArray = [NSMutableArray array];
    }
    return _dealsArray;
}

- (id)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置流水布局中的itemSize的大小
    layout.itemSize = CGSizeMake(305, 305);
    layout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景色
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //注册TRCollectionViewCell.xib的cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"TRCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    //创建刷新控件
    [self setUpRefreshControl];
}



#pragma mark -- 创建刷新控件
- (void)setUpRefreshControl {
    UIRefreshControl *freshControl = [[UIRefreshControl alloc] init];
    //设置其他的属性
    //垂直方向的偏移量
    freshControl.triggerVerticalOffset = 100;
    //文本属性
    freshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"正在等待加载更多团购"];
    //给刷新控件添加触发方法
    [freshControl addTarget:self action:@selector(loadMoreDeals) forControlEvents:UIControlEventValueChanged];
    
    //加载到view
    self.collectionView.bottomRefreshControl = freshControl;
}

//加载更多订单数据
- (void)loadMoreDeals {
    //self.page++;
    self.page++;
    [self sendRequestToServer];
}

//加载新订单数据
- (void)loadNewDeals {
    self.page = 1;
    [self sendRequestToServer];
}

- (void)sendRequestToServer {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    //调用子类中实现发送参数的方法
    [self settingParams:params];
    
    //默认的page参数
    params[@"page"] = @(self.page);
    
    NSLog(@"发送请求的参数: %@", params.allValues);
    
    DPAPI *api = [[DPAPI alloc] init];
    [api requestWithURL:@"v1/deal/find_deals" params:params delegate:self];
}

#pragma mark -- 发送请求回调方法
- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result {
    //    NSLog(@"发送成功: %@", result);
    //result(NSDictonary --> TRDeal)
    //    NSArray *array = [self parseDealWithResult:result];
    NSArray *array = [TRMetaDataTool deals:result];
    
    //情况一: 没有上拉加载
    if (self.page == 1) {
        //将之前旧的团购数据清空
        [self.dealsArray removeAllObjects];
    }
    //情况二: 有上拉加载
    [self.dealsArray addObjectsFromArray:array];
    
    //刷新collection view
    [self.collectionView reloadData];
    
    //结束刷新动画
    [self.collectionView.bottomRefreshControl endRefreshing];
}

- (NSArray *)parseDealWithResult: (id)result {
    //创建一个可变数组
    NSMutableArray *dealArray = [NSMutableArray array];
    
    NSArray *array = result[@"deals"];
    //解析; 添加到数组
    for (NSDictionary *dealDic in array) {
        //解析
        TRDeal *deal = [[TRDeal alloc] init];
        [deal setValuesForKeysWithDictionary:dealDic];
        [dealArray addObject:deal];
    }
    
    return [dealArray copy];
    
}

- (void)request:(DPRequest *)request didFailWithError:(NSError *)error {
    NSLog(@"发送失败: %@", error.userInfo);
    
    //结束刷新动画
    [self.collectionView.bottomRefreshControl endRefreshing];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //默认如果没有limit参数，服务器返回20团购订单
    return self.dealsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TRCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"deal" forIndexPath:indexPath];
    
    // Configure the cell
    //给自定义的collection cell赋值
    cell.deal = self.dealsArray[indexPath.row];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

//点中collection cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //创建详情对象
    TRDetailViewController *detailViewController = [TRDetailViewController new];
    TRDeal *deal = self.dealsArray[indexPath.row];
    detailViewController.deal = deal;
    
    //弹出详情试图控制器
    [self presentViewController:detailViewController animated:YES completion:nil];
}

@end
