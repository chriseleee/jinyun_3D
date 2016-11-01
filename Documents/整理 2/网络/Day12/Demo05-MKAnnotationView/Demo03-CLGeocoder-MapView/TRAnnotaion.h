//
//  TRAnnotaion.h
//  Demo03-CLGeocoder-MapView
//
//  Created by tarena on 15/9/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface TRAnnotaion : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

//添加一个和图片相关的属性(名字可以任意指定)
@property (nonatomic, strong) UIImage *image;









@end
