//
//  MyViewController.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/27.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "MyViewController.h"
#import "MyHeaderLoginView.h"
#import "AccountNumberVC.h"
#import "LoginViewController.h"
@interface MyViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArray;
/**
 *  <#Description#>
 */
@end

@implementation MyViewController

-(NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@"我的订单",@"会员",@"我的投资人",@"通知",@"设置",@"img_myorder",@"img_member",@"img_investor",@"img_notice",@"img_set"];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

-(void)creatUI{
    

    _tableView = [[UITableView alloc]init];
    [self.view addSubview:_tableView];
    
    WS(ws)
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view);
    }];
    //获取缓存数据
    //获取帐号信息字典
    NSMutableDictionary* loginDic = [CGFileManager readDocumentfile:kProfileDocument_login ];
    if (!loginDic) {
        loginDic = [NSMutableDictionary dictionary];
    }
    MyHeaderLoginView *header = [[MyHeaderLoginView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, AdjustH(200))];
    header.headerData = [NSDictionary dictionaryWithDictionary:loginDic];
    [header.loginBtn addTarget:self action:@selector(titleClick) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableHeaderView = header;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self creatUI];
    self.title = nil;
    self.tabBarItem.title = @"我的";
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}


- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

//设置顶部20的部分字体颜色变为白色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 登录点击事件

-(void)titleClick{
    
    BOOL islogin = [CGTool isLogin];
    if (islogin) {
        AccountNumberVC *account = [[AccountNumberVC alloc]init];
        
        [self.navigationController pushViewController:account animated:YES];
    }else{
        LoginViewController *login = [[LoginViewController alloc]init];
        
        [self.navigationController pushViewController:login animated:YES];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count/2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AdjustH(68);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:1 reuseIdentifier:@"cell"];
        
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.dataArray[indexPath.row+5]];
    
    return cell;
}




@end
