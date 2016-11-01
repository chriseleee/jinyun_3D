//
//  ViewController.m
//  Demo03-CLGeocoder-MapView
//
//  Created by tarena on 15/9/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "TRAnnotation.h"

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
    self.mapView.mapType = MKMapTypeStandard;
    
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


//地图拖拽的情况调用方法
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    
    NSLog(@"span: %f; %f", self.mapView.region.span.latitudeDelta, self.mapView.region.span.longitudeDelta);
}

//自定义大头针必须实现的代理方法
//1.地图上有多少大头针，调用多少次
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    NSLog(@"自定义大头针方法");
    //6.如果默认返回nil，当前的用户位置为默认的蓝色；其他的默认是红色的
//    return nil;
    //把用户位置所属的大头针类型排除在外
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        //当前的大头针对象annotation是用户的位置
        return nil;//蓝色
    }
    
    //2.使用重用机制
    //2.1 声明一个可重用的大头针identifier
    static NSString *identifier = @"Annotation";
    //2.2 从缓冲池中获取可重用的大头针对象,如果有，就直接放回
    MKPinAnnotationView *pinAnnotation = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    //2.3 如果缓冲池中没有，再重现创建大头针对象
    if (!pinAnnotation) {
        //3.第一个参数必须nil(?????)
        pinAnnotation = [[MKPinAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:identifier];
        //4.必须要设置一个显示弹出框的属性(否则title/subtitle无法显示)
        pinAnnotation.canShowCallout = YES;
        
        //设置大头针左右辅助视图
        pinAnnotation.leftCalloutAccessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_classify_cafe"]];
        pinAnnotation.rightCalloutAccessoryView = [[UISwitch alloc] init];
    }
    
    //设置pin大头针的属性(iOS9会多一个自定义颜色的属性)
    pinAnnotation.pinColor = MKPinAnnotationColorPurple;
    //7.大头针视图的动画和图片设置不能同时
//    pinAnnotation.animatesDrop = YES;
    //设置一个大头针的图片
    pinAnnotation.image = [UIImage imageNamed:@"icon_classify_cafe"];
    
    //5.将代理方法中的形参annotation赋值给pinAnnoation视图对象
    pinAnnotation.annotation = annotation;
    
    return pinAnnotation;
}

//手动添加两个大头针
- (IBAction)addAnnotation:(id)sender {

    //创建两个自定义的大头针对象
    TRAnnotation *firstAnnotation = [[TRAnnotation alloc] init];
    TRAnnotation *secondAnnotation = [[TRAnnotation alloc] init];
    
    //设置添加大头针的属性(位置/title文本/subtitle子文本)
    firstAnnotation.coordinate = CLLocationCoordinate2DMake(39.875, 116.456);
    firstAnnotation.title = @"iOS1506";
    firstAnnotation.subtitle = @"Fighting";
    
    secondAnnotation.coordinate = CLLocationCoordinate2DMake(39.879, 116.451);
    secondAnnotation.title = @"iOS1506";
    secondAnnotation.subtitle = @"AZAZA";
    
    //添加到地图上
    [self.mapView addAnnotation:firstAnnotation];
    [self.mapView addAnnotation:secondAnnotation];
    
    //设置地图显示的区域(中心/跨度)
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
    MKCoordinateRegion region = MKCoordinateRegionMake(secondAnnotation.coordinate, span);
    [self.mapView setRegion:region animated:YES];
}








@end
