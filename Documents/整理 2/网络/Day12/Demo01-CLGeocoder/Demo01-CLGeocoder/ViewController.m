//
//  ViewController.m
//  Demo01-CLGeocoder
//
//  Created by tarena on 15/9/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)clickGeoCoder:(id)sender {
    NSString *cityName = @"北京";
    //1.创建CLGeocoder对象
    CLGeocoder *geoCoder = [CLGeocoder new];
    
    //2.调用地理编码的方法
    [geoCoder geocodeAddressString:cityName completionHandler:^(NSArray *placemarks, NSError *error) {
        //placemarks数组中的每一项的类型CLPlacemark
        if (error == nil) {
            for (CLPlacemark *placemark in placemarks) {
                NSLog(@"longitued:%f; latitude:%f; addressDic:%@", placemark.location.coordinate.longitude, placemark.location.coordinate.latitude,placemark.addressDictionary);
            }
        }
    }];
    
}
- (IBAction)clickReverseGeoCoder:(id)sender {
    //经纬度CLLocation
    CLLocation *location = [[CLLocation alloc] initWithLatitude:39.904989 longitude:116.405285];
    
    //创建CLGeocoder对象
    CLGeocoder *geocoder = [CLGeocoder new];
    
    //对应经纬度的详细信息(addressDictionary)
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error == nil) {
            for (CLPlacemark *placemark in placemarks) {
                NSLog(@"longitude:%f; latitude:%f; addressDictionary:%@", placemark.location.coordinate.longitude, placemark.location.coordinate.latitude, placemark.addressDictionary);
            }
        }
    }];
}








@end
