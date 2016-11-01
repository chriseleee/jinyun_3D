//
//  ViewController.m
//  Demo03-CLGeocoder-MapView
//
//  Created by tarena on 15/9/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "TRAnnotaion.h"

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

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    //把用户的位置对应的大头针排除
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;//蓝色圈
    }
    
    //重用机制
    static NSString *identifier = @"Annotation";
    //不用转换
    MKAnnotationView *annotationView = [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView) {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:identifier];
        //显示title/subtitile属性
        annotationView.canShowCallout = YES;
    }
    
    //方式二(MKAnnotionaView)和方式一(MKPinAnnotationView)的不同
    TRAnnotaion *anno = (TRAnnotaion *)annotation;
    annotationView.annotation = anno;
    annotationView.image = anno.image;
    
    return annotationView;
}

- (IBAction)addAnnotation:(id)sender {
    
    //创建两个大头针对象
    TRAnnotaion *firstAnnoation = [[TRAnnotaion alloc] init];
    TRAnnotaion *secondAnnotion = [[TRAnnotaion alloc] init];
    firstAnnoation.coordinate = CLLocationCoordinate2DMake(39.875, 116.342);
    firstAnnoation.title = @"iOS1506";
    firstAnnoation.subtitle = @"Fighting";
    //不同
    firstAnnoation.image = [UIImage imageNamed:@"icon_paopao_waterdrop_streetscape"];
    
    secondAnnotion.coordinate = CLLocationCoordinate2DMake(39.877, 116.457);
    secondAnnotion.title = @"iOS1506";
    secondAnnotion.subtitle = @"AZAZA";
    //不同
    secondAnnotion.image = [UIImage imageNamed:@"icon_pin_floating"];
    
    //添加到地图上; 设定地图的区域(中心/跨度)
    [self.mapView addAnnotation:firstAnnoation];
    [self.mapView addAnnotation:secondAnnotion];
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.2, 0.2);
    MKCoordinateRegion region = MKCoordinateRegionMake(firstAnnoation.coordinate, span);
    [self.mapView setRegion:region animated:YES];
    
    
    
    
    
    
}







@end
