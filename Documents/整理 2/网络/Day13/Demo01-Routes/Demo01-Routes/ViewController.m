//
//  ViewController.m
//  Demo01-Routes
//
//  Created by tarena on 15/9/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

//CLGeocoder
@property (nonatomic, strong) CLGeocoder *geocoder;

@end

@implementation ViewController
- (CLGeocoder *)geocoder {
    if (!_geocoder) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置mapview的delegate
    self.mapView.delegate = self;
}
- (IBAction)drawLines:(id)sender {
    
    NSString *startStr = @"北京";
    NSString *endStr = @"上海";
    
    [self.geocoder geocodeAddressString:startStr completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *startPlacemark = [placemarks lastObject];
        
        [self.geocoder geocodeAddressString:endStr completionHandler:^(NSArray *placemarks, NSError *error) {
            CLPlacemark *endPlacemark = [placemarks lastObject];
            
            [self startNavigateWithStart:startPlacemark withEnd:endPlacemark];
        }];
    }];
}

- (void)startNavigateWithStart:(CLPlacemark *)startPlacemark withEnd:(CLPlacemark *)endPlacemark {
    MKPlacemark *startPlace = [[MKPlacemark alloc] initWithPlacemark:startPlacemark];
    MKMapItem *startItem = [[MKMapItem alloc] initWithPlacemark:startPlace];
    MKPlacemark *endPlace = [[MKPlacemark alloc] initWithPlacemark:endPlacemark];
    MKMapItem *endItem = [[MKMapItem alloc] initWithPlacemark:endPlace];
    
    //1.创建发送请求对象(调用方法)
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    //设置属性
    request.source = startItem;
    request.destination = endItem;
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (!error) {
            //2.获取所有的路线，获得每个路线对应的step
            NSArray *routesArray = response.routes;
            for (MKRoute *route in routesArray) {
                NSLog(@"总长度:%f千米;预计总时间:%f小时", route.distance/1000, route.expectedTravelTime/3600);
                
                //添加几何线
                [self.mapView addOverlay:route.polyline];
                
                NSArray *stepsArray = route.steps;
                for (MKRouteStep *step in stepsArray) {
                    NSLog(@"每个step描述:%@; step距离:%f", step.instructions, step.distance);
                }
            }
        }
    }];
}

#pragma mark --- MKMapView Delegate
//在地图上添加overlay遮盖物调用
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer *line = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    
    //线宽
    line.lineWidth = 4;
    
    //线的颜色
    line.strokeColor = [UIColor redColor];
    
    return line;
}










@end
