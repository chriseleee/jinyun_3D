//
//  TRWeatherMainViewController.m
//  TRWeather
//
//  Created by tarena on 15/9/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRWeatherMainViewController.h"
#import "TRHeaderView.h"

@interface TRWeatherMainViewController () <UITableViewDataSource, UITableViewDelegate>

//table view
@property (nonatomic, strong) UITableView *tableView;

//imge view(背景图片)
@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation TRWeatherMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化table view
    [self setupTableView];
    
    //创建头部视图
    [self setupHeaderView];
}

#pragma mark --- 初始化table view
- (void)setupTableView {
    //创建背景视图，并添加到view
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.backgroundImageView.image = [UIImage imageNamed:@"bg.png"];
    [self.view addSubview:self.backgroundImageView];
    
    //创建table view，并添加到view上
    self.tableView = [UITableView new];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.frame = self.view.bounds;
    //设定table view重要的设置
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //设置table view的分割线
    self.tableView.separatorColor = [UIColor colorWithWhite:1 alpha:0.2];
    //设置table view page属性
    self.tableView.pagingEnabled = YES;
    
    [self.view addSubview:self.tableView];
}

- (void)setupHeaderView {

    //创建自定的头部视图
    TRHeaderView *headerView = [[TRHeaderView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    headerView.backgroundColor = [UIColor clearColor];
    
    //添加到table view的headerView
    self.tableView.tableHeaderView = headerView;
}

#pragma mark --- tableView dataSoure/delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;//每小时/每天
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning TODO:设定section的行数
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    //设定cell的背景颜色
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    //cell文本颜色
    cell.textLabel.textColor = [UIColor whiteColor];
    //cell不允许点中
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
#warning TODO:设定cell的文本
    //设置cell文本
    if (indexPath.section == 0) {
        //每个小时
        cell.textLabel.text = @"hourly";
    } else {
        //每天预报
        cell.textLabel.text = @"dayly";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
#warning TODO:设定cell的高度
    return 44;
}











@end
