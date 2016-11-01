//
//  ViewController.m
//  Demo05-CoreLocation
//
//  Created by tarena on 15/9/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>

//声明定位管理对象属性
@property (nonatomic, strong) CLLocationManager *mgr;

@end

@implementation ViewController

- (CLLocationManager *)mgr {
    if (!_mgr) {
        _mgr = [[CLLocationManager alloc] init];
    }
    return _mgr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置代理
    self.mgr.delegate = self;
    
    //判定iOS版本
    if ([[UIDevice currentDevice].systemVersion doubleValue] > 8.0) {
        //下面的两个方法对应不用的key(Info.plist)
        //征求用户的同意(在前台和后台定位)
//        [self.mgr requestAlwaysAuthorization];
        //征求用户的同意(只在前台/使用期间定位)
        [self.mgr requestWhenInUseAuthorization];
    } else {
        //iOS<8.0
        [self.mgr startUpdatingLocation];
    }
}

#pragma mark --- CLLocationDelegate
//监控到用户的点击弹出框的动作(允许/不允许)
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {

    switch (status) {
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            //设置定位的精度/准确性
            //最高的定位准确度
            self.mgr.desiredAccuracy = kCLLocationAccuracyBest;
            //设置定位频率(发送请求的次数)
            self.mgr.distanceFilter = kCLDistanceFilterNone;
            
            //开始定位
            [self.mgr startUpdatingLocation];
            break;
        case kCLAuthorizationStatusDenied:
            NSLog(@"用户不允许定位 ");
            break;
            
        default:
            break;
    }
    
}

//定位到用户的位置的代理方法
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    
    NSLog(@"location is %f; %f", location.coordinate.latitude, location.coordinate.longitude);
    
    //手动停止定位的操作
    [self.mgr stopUpdatingLocation];
    
}










@end
