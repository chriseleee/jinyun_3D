//
//  TRAnnotation.h
//  TRFindDeals
//
//  Created by tarena on 15/9/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface TRAnnotation : NSObject <MKAnnotation>
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
//大头针图片属性
@property (nonatomic, strong) UIImage *image;








@end
