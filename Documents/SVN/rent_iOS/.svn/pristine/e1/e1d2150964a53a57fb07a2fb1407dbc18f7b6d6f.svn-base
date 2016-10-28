//
//  HomePageViewController.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/27.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "HomePageViewController.h"
#import "SelectionView.h"
#import "CycleScrollView.h"
#import "HomePageTableViewCell.h"
#import "BaseRentBarTableVC.h"

#import "HomePageSecondVC.h"
#import "HomePageCellModel.h"
#import "BaseUITableView.h"
typedef enum
{
    HomePageSortDefort = 1,
    HomePageSortPriceUp,
    HomePageSortPriceDown,
}HomePageSort;//枚举名称

@interface HomePageViewController ()<CycleScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
/**
 *  排序类型
 */
@property (assign,nonatomic)HomePageSort ordeBy;
/**
 *  品牌
 */
@property (strong,nonatomic)NSString* brandsId;
/**
 *  型号
 */
@property (strong,nonatomic)NSString* version;
/**
 *  最小刷新率
 */
@property (strong,nonatomic)NSString* minRate;
/**
 *  最大刷新率
 */
@property (strong,nonatomic)NSString* maxRate;
/**
 *  当前页
 */
@property (assign,nonatomic)int curPage;
/**
 *  pageSize
 */
@property (strong,nonatomic)NSString* pageSize;
/**
 *  每次发送请求的一个标记
 */
@property (strong,nonatomic)NSString* pvid;
/**
 *  数据数组
 */
@property (strong,nonatomic)NSMutableArray* dataArray;
/**
 *  缓存的数据数组
 */
@property (strong,nonatomic)NSArray* cacheArr;

/**
 *  参数字典
 */
@property (strong,nonatomic)NSDictionary* parametDic;

/**
 *  tableView
 */
@property (strong,nonatomic)BaseUITableView* tableView;
@end

@implementation HomePageViewController

#pragma mark 懒加载
-(NSDictionary *)parametDic{
    if (!_parametDic) {
        _parametDic = @{
                        @"orderBy":[NSString stringWithFormat:@"%u",self.ordeBy],
                        @"brandsId":self.brandsId,
                        @"version":self.version,
                        @"minRate":self.minRate,
                        @"maxRate":self.maxRate,
                        @"curPage":[NSString stringWithFormat:@"%d",self.curPage],
                        @"pageSize":self.pageSize,
                        @"pvid":self.pvid,
                        };

    }
    return _parametDic;
}

/**
 *  tableView
 */
-(BaseUITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[BaseUITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}


-(NSArray *)cacheArr{
    if (!_cacheArr) {
        _cacheArr = [NSArray array];
    }
    return _cacheArr;
}


#pragma mark viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //导航栏标题
    UIImageView *titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"VR_title"]];
    self.navigationItem.titleView = titleView;
    
    //设置默认值
    [self setDefortAttribute];
    
    //开启刷新状态
    [self setupRefresh];
    
    //导入数据
    [self dataWithCaches];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma maek - MJRefresh

//开始刷新自定义方法
- (void)setupRefresh
{
    WS(ws)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [ws headerRereshing];
    }];

    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];

}

-(void)dataWithCaches{
    NSArray *dataArr = [CGFileManager readCachesfile:kProfileCaches_homePageCell];
    if (dataArr) {
        self.dataArray = [NSMutableArray arrayWithArray:dataArr];
    }else{
        [self updateData];
    }
}

//下拉刷新
- (void)headerRereshing
{
    //一般这些个里边是网络请求，然后会有延迟，不会像现在刷新这么快
    // 1.刷新动作
   [self updateData];
    
}

//上拉加载
- (void)footerRereshing
{
    //这个一般是提取缓存的数据
    // 1.加载数据
    [self loadMoreData];
    
}

/**
 *  停止刷新
 */
-(void)endRefresh{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}


#pragma mark 数据请求设置

//设置默认值
-(void)setDefortAttribute{
    self.ordeBy = HomePageSortDefort;
    self.brandsId = @"0";
    self.version = @"0";
    self.minRate = @"0";
    self.maxRate = @"0";
    self.curPage = 1;
    self.pageSize = @"20";
    self.pvid = @"";
    
    //添加通知
    [HWNotificationCenter addObserver:self selector:@selector(toRefreshInterface:) name:CGHomePagePostParmentNotification object:nil];
}

/**
 *  更新数据.
 *
 *  数据更新后,会自动更新视图.
 */
- (void)updateData{
    
    NSString *curPage = [NSString stringWithFormat:@"%u",self.curPage];
    self.parametDic = @{
             @"orderBy":[NSString stringWithFormat:@"%u",self.ordeBy],
             @"brandsId":self.brandsId,
             @"version":self.version,
             @"minRate":self.minRate,
             @"maxRate":self.maxRate,
             @"curPage":curPage,
             @"pageSize":self.pageSize,
             @"pvid":@""
             };
    
    [self NetToLoadData:self.parametDic];
}

-(void)NetToLoadData:(NSDictionary*)paramentDic
{
    //数据加载的图片
    [self.tableView errorType:buildinginType isDisplay:YES];
    [self.tableView reloadEmptyDataSet];
    
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:paramentDic];
   
    
    [[NetKit kit]GETWithURLString:@"api/rent/findRents" parameters:dic success:^(id ret) {
        self.pvid = ret[@"pvid"];
        NSArray *newData = [HomePageCellModel objectArrayWithKeyValuesArray:ret[@"body"]];

        
        //缓存数据
        [CGFileManager writeCachesFile:kProfileCaches_homePageCell forObject:newData];
        self.dataArray = [NSMutableArray arrayWithArray:newData];
        [self.tableView reloadData];
        
        //2.结束刷新
        [self endRefresh];
        
    } error:^(NSInteger code, NSString *msg, id ret) {
        
        //2.结束刷新
        [self endRefresh];
        //数据加载的图片
        [self.tableView errorType:noDataType isDisplay:YES ];
        [self.tableView reloadEmptyDataSet];
    } failure:^(NSError *error) {
        
        //2.结束刷新
        [self endRefresh];
        //数据加载的图片
        [self.tableView errorType:internetErrorType isDisplay:YES ];
        [self.tableView reloadEmptyDataSet];
    }];

}

/**
 *  上拉加载
 */
- (void)loadMoreData{
    
    self.curPage ++;
    //数据加载的图片
    [self.tableView errorType:buildinginType isDisplay:YES];
    [self.tableView reloadEmptyDataSet];
    
    self.parametDic = @{
             @"orderBy":[NSString stringWithFormat:@"%u",self.ordeBy],
             @"brandsId":self.brandsId,
             @"version":self.version,
             @"minRate":self.minRate,
             @"maxRate":self.maxRate,
             @"curPage":[NSString stringWithFormat:@"%u",self.curPage],
             @"pageSize":self.pageSize,
             @"pvid":self.pvid
             };

    [[NetKit kit]GETWithURLString:@"api/rent/findRents" parameters:self.parametDic success:^(id ret) {
        self.pvid = ret[@"pvid"];
        NSArray *newData = [HomePageCellModel objectArrayWithKeyValuesArray:ret[@"body"]];
        [self.dataArray addObjectsFromArray:newData];
        //2.结束刷新
        [self endRefresh];
    } error:^(NSInteger code, NSString *msg, id ret) {
        //2.结束刷新
        [self endRefresh];
        
        [self.tableView errorType:noDataType isDisplay:YES];
        [self.tableView reloadEmptyDataSet];
        self.curPage --;
    } failure:^(NSError *error) {
        //2.结束刷新
        [self endRefresh];
        self.curPage --;
        
        [self.tableView errorType:loadErrorType isDisplay:YES];
        [self.tableView reloadEmptyDataSet];
    }];
}

- (void)toRefreshInterface:(NSNotification *)notification
{
    [self NetToLoadData:notification.userInfo];
}
#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if(1==section){
        return self.dataArray.count;
    }
    return 0;
}


- (HomePageTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomePageTableViewCell *cell = [HomePageTableViewCell cellWithTableView:tableView];
    //cell点击后不变色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentDic = self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AdjustW(150);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (0==section) {
        return AdjustW(167);
    }else if (1==section){
        return AdjustW(35);
    }
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (0==section) {
//        CycleScrollView * firstHeaderView = [[CycleScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 167)];
//        firstHeaderView.delegate = self;
        UIImageView *headerImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pp"]];
//        NSString *imageUrl = @"/ar/1.jpg";
//        NSArray *imageAr = [NSArray arrayWithObject:imageUrl];
//        
//        NSMutableArray *bannersArra = [[NSMutableArray alloc]init];
//        [imageAr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSString *urlPic = (NSString*)obj;
//            [bannersArra addObject:[urlPic imageURL]];
//        }];
//        
//        firstHeaderView.imageArray = bannersArra;

        return headerImage;
    }else if (1==section){
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , AdjustW(35))];
        
        SelectionView *selectionView = [[SelectionView alloc]init];
        [headerView addSubview:selectionView];
        
        [selectionView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headerView.left);
            make.top.equalTo(headerView.top);
            make.right.equalTo(headerView.right);
            make.bottom.equalTo(headerView.bottom);
        }];

        UIView* bottomLine = [[UIView alloc]init];
        [headerView addSubview:bottomLine];
        [bottomLine makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headerView.left);
            make.top.equalTo(headerView.bottom);
            make.right.equalTo(headerView.right);
            make.height.equalTo(@1);
        }];
        bottomLine.backgroundColor = [UIColor color999999];
        selectionView.parametDic = self.parametDic;
        
        return headerView;
//        return nil;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HomePageSecondVC * vc= [[HomePageSecondVC alloc]init];
    HomePageCellModel *model = self.dataArray[indexPath.row];
    vc.rentId = model.parentId;
    [self.navigationController pushViewController:vc animated:YES];
//    vc.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:vc action:@selector(more) image:@"btn_share" highImage:@"btn_share"];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
