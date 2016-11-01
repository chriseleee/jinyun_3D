//
//  ViewController.m
//  Demo06-Default-Routing
//
//  Created by tarena on 15/9/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()
@property (nonatomic, strong) CLGeocoder *geocoder;

@end

@implementation ViewController

- (CLGeocoder *)geocoder {
    if (!_geocoder) {
        _geocoder = [CLGeocoder new];
    }
    return _geocoder;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //起始点/终点
    NSString *startPoint = @"北京";
    NSString *endPoint = @"上海";
    
    //使用"地理编码"将起始点和终点转换成CLPlacemark
    [self.geocoder geocodeAddressString:startPoint completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *startPlacemark = [placemarks lastObject];
        
        //对终点进行地理编码
        [self.geocoder geocodeAddressString:endPoint completionHandler:^(NSArray *placemarks, NSError *error) {
            CLPlacemark *endPlacemark = [placemarks lastObject];
            
            //开始从起始地标对象到终点地标对象导航
            [self navigateWithStart:startPlacemark withEnd:endPlacemark];
        }];
    }];
}

- (void)navigateWithStart:(CLPlacemark *)startPlacemark withEnd:(CLPlacemark *)endPlacemark {
    
    //创建两个MKMapItem
    MKPlacemark *startMark = [[MKPlacemark alloc] initWithPlacemark:startPlacemark];
    MKMapItem *startMapItem = [[MKMapItem alloc] initWithPlacemark:startMark];
    MKPlacemark *endMark = [[MKPlacemark alloc] initWithPlacemark:endPlacemark];
    MKMapItem *endMapItem = [[MKMapItem alloc] initWithPlacemark:endMark];
    NSArray *array = @[startMapItem, endMapItem];
    
    //设置开车/步行
    NSMutableDictionary *optionDic = [NSMutableDictionary dictionary];
    optionDic[MKLaunchOptionsDirectionsModeKey] = MKLaunchOptionsDirectionsModeDriving;
    //设置地图显示类型
    optionDic[MKLaunchOptionsMapTypeKey] = @(MKMapTypeHybrid);
    
    //直接调用系统默认的地图导航app
    [MKMapItem openMapsWithItems:array launchOptions:optionDic];
}











@end
