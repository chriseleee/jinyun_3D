//
//  ViewController.m
//  Demo03-CLGeocoder-MapView
//
//  Created by tarena on 15/9/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

//CLLocationManager
@property (nonatomic,strong) CLLocationManager *mgr;

//CLGeocoder
@property (nonatomic, strong) CLGeocoder *geocoder;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mgr = [CLLocationManager new];
    self.geocoder = [CLGeocoder new];
    
    //征求用户的意见 (Info.plist)
    [self.mgr requestWhenInUseAuthorization];
    
    //设置代理
    self.mapView.delegate = self;
    
    //设置地图的属性
    self.mapView.rotateEnabled = YES;
    //设置地图的显示方式(卫星/卫星混合)
    
    //执行定位操作
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
}



#pragma mark --- MapView Delegate
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    //使用反地理编码来获取用户位置对应的详细信息(国家/省)
    [self.geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray *placemarks, NSError *error) {
        //使用placemark给定的信息，设置用户位置大头针的文本信息
        CLPlacemark *placemark = [placemarks lastObject];
        //title
        userLocation.title = placemark.name;
        
        //subtitle
        userLocation.subtitle = placemark.locality;
    }];
    
    //显示地图
    MKCoordinateSpan span = MKCoordinateSpanMake(0.5, 0.5);
    MKCoordinateRegion region = MKCoordinateRegionMake(userLocation.location.coordinate, span);
    [self.mapView setRegion:region animated:YES];
}








@end
