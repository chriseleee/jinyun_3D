//
//  ViewController.m
//  Demo02-MKMapView
//
//  Created by tarena on 15/9/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *mgr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.征求用户同意(CLLocationManager)
    self.mgr = [CLLocationManager new];
    //在使用期间的定位 (Info.plist) -> 允许Allow
    [self.mgr requestWhenInUseAuthorization];
    
    //2.设置地图相关的代理
    self.mapView.delegate = self;
    
    //3.执行定位操作(设置地图视图的一个属性)
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
}

#pragma mark --- MapViewDelegate
//已经定位到用户的位置的触发方法
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    NSLog(@"latitude:%f; longitude:%f", userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude);
    
    //显示地图 (区域Region；跨度Span)
    CLLocationCoordinate2D center = userLocation.location.coordinate;
    MKCoordinateSpan span = MKCoordinateSpanMake(0.5, 0.5);
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    [self.mapView setRegion:region animated:YES];
}




@end
