//
//  ViewController.m
//  Demo02-BaiDuMap
//
//  Created by tarena on 15/9/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <BaiduMapAPI/BMapKit.h>
#import <BaiduMapAPI/BMKMapView.h>

//POI搜索功能(搜索感兴趣的点)
@interface ViewController () <BMKMapViewDelegate, BMKPoiSearchDelegate>

@property (nonatomic, strong) BMKMapView *mapView;
@property (nonatomic, strong) BMKPoiSearch *poiSearch;

@end

@implementation ViewController

- (BMKPoiSearch *)poiSearch {
    if (!_poiSearch) {
        _poiSearch = [[BMKPoiSearch alloc] init];
    }
    return _poiSearch;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加map view
    self.mapView = [[BMKMapView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.mapView];
    
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.center = CGPointMake(200, 200);
    [button addTarget:self action:@selector(clickAdd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //设置代理
    self.poiSearch.delegate = self;
}

- (void)clickAdd {
    //创建了一个poi SearchOption的对象
    BMKCitySearchOption *option = [[BMKCitySearchOption alloc] init];
    
    //设置poi SearchOption的属性(city/keyword/pageIndex/pageCapacity)
    option.city = @"北京";
    option.keyword = @"atm";
    option.pageIndex = 0;
    option.pageCapacity = 50;
    
    //执行搜索的动作
    BOOL isSuccess = [self.poiSearch poiSearchInCity:option];
    if (!isSuccess) {
        NSLog(@"发送失败 ");
    }
}

#pragma mark --- BMKPoiSearchDelegate
- (void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult *)poiResult errorCode:(BMKSearchErrorCode)errorCode {
    if (errorCode == BMK_SEARCH_NO_ERROR) {
        //获取服务器返回的感兴趣数组
        NSArray *poiArray = poiResult.poiInfoList;
        
        //循环对搜索到得poi对象对应的位置，添加大头针
        for (BMKPoiInfo *poiInfo in poiArray) {
            //创建大头针对象
            BMKPointAnnotation *annotation = [[BMKPointAnnotation alloc] init];
            //设置大头针对象属性
            annotation.coordinate = poiInfo.pt;
            annotation.title = poiInfo.name;
            annotation.subtitle = poiInfo.address;
            [self.mapView addAnnotation:annotation];
        }
    }
}












@end
