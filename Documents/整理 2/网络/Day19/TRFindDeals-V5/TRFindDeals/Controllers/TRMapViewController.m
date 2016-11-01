//
//  TRMapViewController.m
//  TRFindDeals
//
//  Created by tarena on 15/9/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMapViewController.h"
#import <MapKit/MapKit.h>
#import "DPAPI.h"
#import "UIBarButtonItem+TRBarButtonItem.h"
#import "TRMetaDataTool.h"
#import "TRDeal.h"
#import "TRBusiness.h"
#import "TRAnnotation.h"

@interface TRMapViewController ()<MKMapViewDelegate, DPRequestDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLGeocoder *geocoder;
@property (nonatomic, strong) CLLocationManager *mgr;
@property (nonatomic, strong) NSString *cityName;

@end

@implementation TRMapViewController

- (CLGeocoder *)geocoder {
    if (!_geocoder) {
        _geocoder = [CLGeocoder new];
    }
    
    return _geocoder;
}

- (CLLocationManager *)mgr {
    if (!_mgr) {
        _mgr = [CLLocationManager new];
    }
    return _mgr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置左边的返回按钮
    UIBarButtonItem *backItem = [UIBarButtonItem itemWithImageName:@"icon_back" withHighlightedImageName:@"icon_highlighted" target:self withAction:@selector(clickBackButton)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    //设置mgr的delegate
    self.mapView.delegate = self;
    
    //征求用户的同意(Info.plist)
    [self.mgr requestWhenInUseAuthorization];
    
    //开始定位
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
}

//点中左上角返回按钮的触发方法
- (void)clickBackButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//定位到用户位置的方法
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    //获取用户的经纬度:userLocation
    
    //通过反地理编码获取用户所在的城市(发送给服务器)
    [self.geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks lastObject];
        NSLog(@"地标的信息:%@", placemark.addressDictionary);
        //获取用户的城市(北京市/济南市)
        NSString *cityName = placemark.addressDictionary[@"City"];
        self.cityName = [cityName substringToIndex:cityName.length - 1];
    }];
    
    //发送请求获取团购订单(以用户经纬度为中心，方圆5000米的团购订单)
    [self mapView:self.mapView regionDidChangeAnimated:YES];
}

//地图的区域发生变化的方法
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    //如果cityName为空，直接返回
    if (self.cityName == nil) {
        return;
    }
    
    //获取当前地图的中心经纬度(!!!城市的参数还以用户所在的城市!!!)
    double latitude = mapView.region.center.latitude;
    double longitude = mapView.region.center.longitude;
    
    //重新发送请求(以当前地图显示中心位置为中心，以5000米为半径)
    DPAPI *api = [DPAPI new];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //城市参数
    params[@"city"] = self.cityName;
    
    //经纬度和半径
    params[@"latitude"]  = @(latitude);
    params[@"longitude"] = @(longitude);
    params[@"radius"]    = @(5000);
    
    //发送请求给服务器
    [api requestWithURL:@"v1/deal/find_deals" params:params delegate:self];
}

#pragma mark --- dianPingDelegate
- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result {
    //解析服务器返回的result (TRDeal)
    NSArray *dealsArray = [TRMetaDataTool deals:result];
    if (dealsArray.count == 0) {
        return;
    }
    //获取商户所在的经纬度
    for (TRDeal *deal in dealsArray) {
        NSArray *businessArray = [TRMetaDataTool businessesWithDeal:deal];
        //在商户所在的位置定大头针(循环)
        for (TRBusiness *business in businessArray) {
            //创建大头针模型对象TRAnnotation
            TRAnnotation *annotation = [TRAnnotation new];
            //设定大头针的经纬度
            annotation.coordinate = CLLocationCoordinate2DMake([business.latitude doubleValue] , [business.longitude doubleValue]);
            annotation.title = business.name;
            annotation.subtitle = deal.desc;
            
            //添加到地图上
            [self.mapView addAnnotation:annotation];
        }
    }
}

- (void)request:(DPRequest *)request didFailWithError:(NSError *)error {
    
}

















@end
