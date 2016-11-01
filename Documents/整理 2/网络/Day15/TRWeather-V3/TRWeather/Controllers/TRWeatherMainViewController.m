//
//  TRWeatherMainViewController.m
//  TRWeather
//
//  Created by tarena on 15/9/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRWeatherMainViewController.h"
#import "TRHeaderView.h"
#import "TRWeather.h"

//针对第三方库的头文件
#import "TSMessage.h"
#import "TSMessageView.h"

#import "UIImageView+WebCache.h"
#import <CoreLocation/CoreLocation.h>

#define TRImageFile(urlStr) [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:[urlStr lastPathComponent]]

@interface TRWeatherMainViewController () <UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>

//table view
@property (nonatomic, strong) UITableView *tableView;

//imge view(背景图片)
@property (nonatomic, strong) UIImageView *backgroundImageView;

//每小时数组
@property (nonatomic, strong) NSArray *hourlyArray;

//每天数组
@property (nonatomic, strong) NSArray *dailyArray;
//头部视图
@property (nonatomic, strong) TRHeaderView *headerView;

//操作队列
@property (nonatomic, strong) NSOperationQueue *queue;
//可变字典存储下载好的图片
@property (nonatomic, strong) NSMutableDictionary *imagesDic;

//下面是和定位相关的属性
@property (nonatomic, strong) CLLocationManager *mgr;
@property (nonatomic, assign) CLLocationDegrees latitude;
@property (nonatomic, assign) CLLocationDegrees longitude;

@end

@implementation TRWeatherMainViewController

//懒加载初始化管理对象
- (CLLocationManager *)mgr {
    if (!_mgr) {
        _mgr = [CLLocationManager new];
    }
    return _mgr;
}

//懒加载初始化可变字典
-(NSMutableDictionary *)imagesDic {
    if (!_imagesDic) {
        _imagesDic = [NSMutableDictionary dictionary];
    }
    return _imagesDic;
}

//懒加载初始化操作队列
- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue  = [[NSOperationQueue alloc] init];
    }
    return _queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //征求用户的定位同意
    [self getUserLocation];
    
    //初始化table view
    [self setupTableView];
    
    //创建头部视图
    [self setupHeaderView];
    
    //发送请求，解析JSON
//    [self getAndParseJson];
}

#pragma mark --- 定位相关
- (void)getUserLocation {
    //征求用户的同意
    if ([[UIDevice currentDevice].systemVersion doubleValue] > 8.0) {
        //在使用期间定位(Info.plist)
        [self.mgr requestWhenInUseAuthorization];
    } else {
        NSLog(@"不支持iOS8.0以下");
    }
    
    //设定定位的delegate(用户是否同意/定位用户的位置)
    self.mgr.delegate = self;
    
    self.latitude = 0.0;
    self.longitude = 0.0;
}

#pragma mark --- 定位相关的delegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        //设定定位的准确度
        self.mgr.desiredAccuracy = kCLLocationAccuracyBest;
        
        //开始定位
        [self.mgr startUpdatingLocation];
    } else if (status == kCLAuthorizationStatusDenied) {
        NSLog(@"无法获取数据");
        //手动的让用户选择城市
    }
}
//定位到用户的位置 (调用多次)
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    //获取用户的位置
    CLLocation *location = [locations lastObject];
    self.latitude = location.coordinate.latitude;
    self.longitude = location.coordinate.longitude;
    
    //手动地停止定位动作
    [self.mgr stopUpdatingLocation];
    
    //开始获取服务器的json数据
    [self getAndParseJson];
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
    self.headerView = [[TRHeaderView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.headerView.backgroundColor = [UIColor clearColor];
    
    //添加到table view的headerView
    self.tableView.tableHeaderView = self.headerView;
}

- (void)getAndParseJson {
    //设置第三方弹出框对应的默认视图控制器
    [TSMessage setDefaultViewController:self];
    
    //判定是否定位到用户
    NSString *urlStr = nil;
    if (self.latitude != 0.0 && self.longitude != 0.0) {
        //定位到用户的位置
        urlStr = [NSString stringWithFormat:@"http://api.worldweatheronline.com/free/v2/weather.ashx?q=%f,%f&num_of_days=5&format=json&tp=6&key=cf11c561a51b35e62ccb5c160f07d", self.latitude, self.longitude];
    } else {
        //没有定位到用户的位置/用户没有同意定位(给定一个默认的城市beijing)
        urlStr = @"http://api.worldweatheronline.com/free/v2/weather.ashx?q=beijing&num_of_days=5&format=json&tp=6&key=cf11c561a51b35e62ccb5c160f07d";
    }
  
    //1.获取JSON数据
    //1.1 创建一个请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    //1.2 创建session对象，创建数据任务对象
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //2.解析JSON数据
        if (error == nil) {
            NSError *parseError = nil;
            NSDictionary *weatherJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            
            //3.将解析后的模型对象存储数组[TRWeather]
            self.hourlyArray = [self weatherFromJSON:weatherJson isHourly:YES];
            self.dailyArray = [self weatherFromJSON:weatherJson isHourly:NO];
            //解析头部视图需要的数据
            TRWeather *headerWeather = [TRWeather weatherWithHeaderJSON:weatherJson];
            
            //回到主线程刷新table view
            dispatch_async(dispatch_get_main_queue(), ^{
                //更新头部视图控件的文本
                [self updateHeaderView:headerWeather];
                
                [self.tableView reloadData];
            });
            
            
        } else {
            NSLog(@"请求失败:%@", error.userInfo);
            //alert view (需要用户的交互)
            //第三方库(TSMessage:设定类型；不需要用户的交互)
            //回到主线程设置弹出框的文本
            dispatch_async(dispatch_get_main_queue(), ^{
                [TSMessage showNotificationWithTitle:@"警告!" subtitle:@"网络繁忙，请稍后再试." type:TSMessageNotificationTypeWarning];
            });
        }
    }];
    
    //1.3 执行任务
    [task resume];
}

#pragma mark --- 解析JSON的方法
- (void)updateHeaderView:(TRWeather *)headerWeather {
    self.headerView.cityLabel.text = headerWeather.cityName;
    self.headerView.conditionsLabel.text = headerWeather.weatherDesc;
    self.headerView.temperatureLabel.text = headerWeather.tempC;
    self.headerView.hiloLabel.text = [NSString stringWithFormat:@"%@˚/ %@˚", headerWeather.maxtempC, headerWeather.mintempC];
    
    //使用SDWebImage设置头部视图的url
    [self.headerView.iconView sd_setImageWithURL:[NSURL URLWithString:headerWeather.iconUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
}

- (NSArray *)weatherFromJSON:(NSDictionary *)jsonDic isHourly:(BOOL)isHourly {
    //jsonDic：服务器返回的整个json数据
    //1.从jsonDic对象中获取每天的数据
    NSArray *dailyArray = jsonDic[@"data"][@"weather"];
    //2.从jsonDic对象中获取每小时的数据
    NSArray *hourlyArray = dailyArray[0][@"hourly"];
    
    //声明两个可变数组
    NSMutableArray *hourlyMutableArray = [NSMutableArray array];
    NSMutableArray *dailyMutableArray = [NSMutableArray array];
    
    if (isHourly) {
        //解析每个小时的数据
        for (NSDictionary *hourlyDic in hourlyArray) {
            TRWeather *hourly = [TRWeather weatherWithHourlyJSON:hourlyDic];
            [hourlyMutableArray addObject:hourly];
        }
    } else {
        //解析每天的数据
        for (NSDictionary *dailyDic in dailyArray) {
            TRWeather *weather = [TRWeather weatherWithDailyJSON:dailyDic];
            [dailyMutableArray addObject:weather];
        }
    }
    
    return isHourly ? [hourlyMutableArray copy] : [dailyMutableArray copy];
}

#pragma mark --- tableView dataSoure/delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;//每小时/每天
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return section == 0 ? self.hourlyArray.count + 1 : self.dailyArray.count + 1;
    
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
    
    //设置cell文本
    if (indexPath.section == 0) {
        //每个小时
        if (indexPath.row == 0) {
            //配置第一行的文本
            [self configureHeaderCell:cell title:@"Hourly Forecast"];
        } else { //设置剩余行的文本
            //获取indexPath对应那行的模型对象
            TRWeather *weather = self.hourlyArray[indexPath.row - 1];
            [self configureCell:cell weather:weather cellIndexPath:indexPath isHourly:YES];
        }
    } else {
        //每天预报
        if (indexPath.row == 0) {
            [self configureHeaderCell:cell title:@"Daily Forecast"];
        } else {
            TRWeather *weather = self.dailyArray[indexPath.row - 1];
            [self configureCell:cell weather:weather cellIndexPath:indexPath isHourly:NO];
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger cellCount = [self tableView:tableView numberOfRowsInSection:indexPath.section];

    return [UIScreen mainScreen].bounds.size.height / cellCount;
}

#pragma mark --- 设置table view的cell
//[self configureHeaderCell:cell title:@"Hourly Forecast"];
//} else { //设置剩余行的文本
//    //获取indexPath对应那行的模型对象
//    TRWeather *weather = self.hourlyArray[indexPath.row - 1];
//    [self configureCell:cell weather:weather cellIndexPath:indexPath isHourly:YES];
- (void)configureHeaderCell:(UITableViewCell *)cell title:(NSString *)title {
    //设置font/size
    cell.textLabel.text = title;
    cell.imageView.image = nil;
    cell.detailTextLabel.text = nil;
}

- (void)configureCell:(UITableViewCell *)cell weather:(TRWeather *)weather cellIndexPath:(NSIndexPath *)indexPath isHourly:(BOOL)isHourly {
    //设置cell中所有数据
    cell.textLabel.text = isHourly ? weather.time : weather.date;
    
    cell.detailTextLabel.text = isHourly ? weather.tempC : [NSString stringWithFormat:@"%@ / %@", weather.maxtempC, weather.mintempC];
    //使用SDWebImage第三方库来实现每行cell的图片下载/缓存
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:weather.iconUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
//    //从内存中拿
//    UIImage *image = self.imagesDic[weather.iconUrl];
//    if (image) {
//        //将内存中的图片设置cell.imageView.image
//        cell.imageView.image = image;
//    } else {
//        //从沙盒中获取已经下载好的图片
//        NSString *filePath = TRImageFile(weather.iconUrl);
//        NSData *data = [NSData dataWithContentsOfFile:filePath];
//        if (data) {
//            //从沙盒中获取图片，设置cell
//            cell.imageView.image = [UIImage imageWithData:data];
//        } else {
//            //开始真正的下载逻辑
//            //添加一个占位图片
//            cell.imageView.image = [UIImage imageNamed:@"placeholder.png"];
//            //设置图片
//            [self downloadImage:weather cell:cell indexPath:indexPath];
//        }
//    }
}

- (void)downloadImage:(TRWeather *)weather cell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    
    //NSString -> NSData -> UIImage (下载:阻塞主线程)
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:weather.iconUrl]];
//    cell.imageView.image = [UIImage imageWithData:data];
    
    //1.创建一个NSBlockOperation对象
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        //耗时的下载操作(子线程)
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:weather.iconUrl]];
        UIImage *image = [UIImage imageWithData:data];
        
        //将下载好的图片UIImage对象存储到imagesDic字典中
        self.imagesDic[weather.iconUrl] = image;
        
        //写个沙盒中(获取沙盒的路径/拼接文件的路径)
//        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
//        NSString *filePath = [cachesPath stringByAppendingPathComponent:[weather.iconUrl lastPathComponent]];
        [data writeToFile:TRImageFile(weather.iconUrl) atomically:YES];
        
        //回到主线程设置cell的图片
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            cell.imageView.image = image;
        }];
    }];
    
    //2.添加到queue队列中
    [self.queue addOperation:operation];
    
}

//接收到系统的内存警告(内存中的数据量大)
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    //先清空字典
    [self.imagesDic removeAllObjects];
    
    //再清空操作队列(停止队列中所有的下载操作)
    [self.queue cancelAllOperations];
}

//细节处理
//将要开始滚动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    //将队列中的操作挂起(暂停)
    [self.queue setSuspended:YES];
}
//已经停止滚动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    //将队列中的操作继续执行
    [self.queue setSuspended:NO];
}







@end
