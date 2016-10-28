//
//  BaseRentBarTableView.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/29.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "BaseRentBarTableVC.h"
#import "RentBarInformationTableCell.h"
#import "RentBarFooterView.h"
#import "RentBarReportCell.h"
#import "RenterBarSecondVC.h"
#import "RentBarReportM.h"
#import "BaseUITableView.h"
@interface BaseRentBarTableVC ()<UITableViewDelegate,UITableViewDataSource>

///@brife TableViews的数据源
@property (strong, nonatomic) NSMutableDictionary *dataSource;

/**
 *  minStatusId
 */
@property (strong,nonatomic)NSString *minStatusId;
/**
 *  minInformationId
 */
@property (strong,nonatomic)NSString *minInformationId;
/**
 *  Information  pagesize
 */
@property (strong,nonatomic)NSString* informationPageSize;
/**
 *  staus pagesize
 */
@property (strong,nonatomic)NSString* statusPagesize;

@property (strong,nonatomic)BaseUITableView* tableView;
@end

@implementation BaseRentBarTableVC

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


-(NSMutableDictionary *)dataSource{
    if (!_dataSource) {
        _dataSource =[[NSMutableDictionary alloc] init];
    }
    return _dataSource;
}

-(NSString *)category{
    if (!_category) {
//        NSString *str = [NSString stringWithFormat:@"%ld",self.selectedIndex];
        
        _category = @"1";
        
        
    }
    return _category;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加通知
    [HWNotificationCenter addObserver:self selector:@selector(changeCurrentPage:) name:CGRentBarPostCurrentPageNotification object:nil];
    //设置默认值
    [self setDefortData];
    //开启刷新状态
    [self setupRefresh];
    //加载Caches数据
    [self dataWithCaches];
    
}
/**
 *  加载Caches数据
 */
-(void)dataWithCaches{
    NSDictionary *dataDic = [CGFileManager readCachesfile:kProfileCaches_RentBarCell forKey:self.category];
    if (dataDic.allKeys.count>0) {
        self.dataSource = [NSMutableDictionary dictionaryWithDictionary:dataDic];
        [self.tableView reloadData];
    }else{
        [self reloadData];
    }
    
}

//开始刷新自定义方法
- (void)setupRefresh
{
    WS(ws)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [ws headerRereshing];
    }];
  
    
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    
}

//下拉刷新
- (void)headerRereshing
{
    //一般这些个里边是网络请求，然后会有延迟，不会像现在刷新这么快
    // 1.刷新动作
    [self reloadData];
    
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
    [self.tableView.header endRefreshing];
    [self.tableView.footer endRefreshing];
}


-(void)setDefortData{
    self.minStatusId = @"0";
    self.minInformationId = @"0";
    self.informationPageSize = @"3";
    self.statusPagesize = @"20";
}

#pragma mark -- 初始化表格的数据源
-(void) initDataSource{
    _dataSource = [[NSMutableDictionary alloc] init];

    
    NSMutableArray *tempArrayFirst  = [[NSMutableArray alloc] initWithCapacity:3];
    

    [_dataSource setObject:tempArrayFirst forKey:@"first"];

}


//下拉加载数据
-(void)reloadData{
    NSDictionary *dicInformation = [NSDictionary dictionary];
    dicInformation = @{
                        @"minStatusId":@"0",
                        @"pageSize":[NSString stringWithFormat:@"%@",self.informationPageSize],
                        @"category":[NSString stringWithFormat:@"%@",self.category],
                        };
    
    [self NetToLoadData:dicInformation];
    [self NetToDownLoadStatusData:dicInformation];
    
    
    
}

//上拉加载数据
-(void)loadMoreData{
    NSDictionary *dicInformation = [NSDictionary dictionary];
    dicInformation = @{
                       @"minStatusId":[NSString stringWithFormat:@"%@",self.minInformationId],
                       @"pageSize":[NSString stringWithFormat:@"%@",self.informationPageSize],
                       @"category":[NSString stringWithFormat:@"%@",self.category],
                       };
    
    [self NetToUpLoadStatusData:dicInformation];
}

-(void)NetToLoadData:(NSDictionary*)paramentDic
{
    
    
    [self.tableView errorType:buildinginType isDisplay:YES];
    [self.tableView reloadEmptyDataSet];
    [[NetKit kit]GETWithURLString:@"api/cms/findCms" parameters:paramentDic success:^(id ret) {
        
        NSArray *newData = [RentBarReportM objectArrayWithKeyValuesArray:ret[@"body"]];
        [self.dataSource setObject:newData forKey:@"first"];
        [self.tableView reloadData];
        
    } error:^(NSInteger code, NSString *msg, id ret) {
        [self.tableView errorType:noDataType isDisplay:YES];
        [self.tableView reloadEmptyDataSet];
    } failure:^(NSError *error) {
        
        [self.tableView errorType:loadErrorType isDisplay:YES];
        [self.tableView reloadEmptyDataSet];
        
    }];
    
}
//下拉刷新
-(void)NetToDownLoadStatusData:(NSDictionary*)paramentDic
{
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:paramentDic];
    
    
    [[NetKit kit]GETWithURLString:@"api/cms/findDys" parameters:dic success:^(id ret) {
        
        NSArray *newData = [RentBarReportM objectArrayWithKeyValuesArray:ret[@"body"]];
        RentBarReportM* model = [newData lastObject];
        self.minInformationId = model.id;
        [self.dataSource setObject:newData forKey:@"second"];
        [self.tableView reloadData];
        //缓存数据
        [CGFileManager writeCachesFile:kProfileCaches_RentBarCell forObject:self.dataSource forKey:self.category];
        //2.结束刷新
        [self endRefresh];

    } error:^(NSInteger code, NSString *msg, id ret) {
        
        //2.结束刷新
        [self endRefresh];

    } failure:^(NSError *error) {
        [self.tableView errorType:loadErrorType isDisplay:YES];
        [self.tableView reloadEmptyDataSet];
        //2.结束刷新
        [self endRefresh];

    }];
    
}
//上拉加载
-(void)NetToUpLoadStatusData:(NSDictionary*)paramentDic
{
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:paramentDic];
   
    
    [[NetKit kit]GETWithURLString:@"api/cms/findDys" parameters:dic success:^(id ret) {
        
        NSArray *newData = [RentBarReportM objectArrayWithKeyValuesArray:ret[@"body"]];
        RentBarReportM* model = [newData lastObject];
        self.minInformationId = model.id;
        NSMutableArray *secondArr =[NSMutableArray arrayWithArray:[self.dataSource objectForKey:@"second"]] ;
        [secondArr insertObjects:newData atIndexes:secondArr.lastObject];
        [self.dataSource setObject:secondArr forKey:@"second"];
        [self.tableView reloadData];
        //缓存数据
        [CGFileManager writeCachesFile:kProfileCaches_RentBarCell forObject:self.dataSource forKey:self.category];
        //2.结束刷新
        [self endRefresh];

    } error:^(NSInteger code, NSString *msg, id ret) {
  
        //2.结束刷新
        [self endRefresh];

    } failure:^(NSError *error) {
        [self.tableView errorType:loadErrorType isDisplay:YES];
        [self.tableView reloadEmptyDataSet];
        //2.结束刷新
        [self endRefresh];

    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 通知事件

-(void)changeCurrentPage:(NSNotification *)notification{
    NSDictionary *dic = notification.userInfo;
    self.category = dic[@"currentPage"];
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (0==section) {
        NSArray *arr =_dataSource[@"first"];
        return arr.count;
    }else{
        NSArray *arr =_dataSource[@"second"];
        return arr.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(0==indexPath.section){
        RentBarInformationTableCell *cell = [RentBarInformationTableCell cellWithTableView:tableView];
        
        cell.contentDic = _dataSource[@"first"][indexPath.row];
        
        //cell点击后不变色
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        RentBarReportCell *cell = [RentBarReportCell cellWithTableView:tableView];
        cell.fatherVC = self;
        cell.reportM = _dataSource[@"second"][indexPath.row];
        //cell点击后不变色
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(0==indexPath.section){
    return AdjustW(115);
    }else{
        RentBarReportM *model = _dataSource[@"second"][indexPath.row];
        
        return model.cellHeight;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (0==section) {
        return AdjustW(44);
    }else{
        return 0;
    }
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (0==section) {
        UIView *footer = [[RentBarFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, AdjustW(44))];
        return footer;
        
    }
    else{
        UIView *footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        
        return nil;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        RenterBarSecondVC * vc = [[RenterBarSecondVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        RenterBarSecondVC * vc = [[RenterBarSecondVC alloc]init];
        RentBarReportM *model = self.dataSource[@"second"][indexPath.row];
        vc.detailId = model.id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
