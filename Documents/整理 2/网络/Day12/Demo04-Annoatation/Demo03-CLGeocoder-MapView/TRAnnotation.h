//
//  TRAnnotation.h
//  Demo03-CLGeocoder-MapView
//
//  Created by tarena on 15/9/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface TRAnnotation : NSObject <MKAnnotation>

//位置(required必须)
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

//title(optional可选)
@property (nonatomic, copy) NSString *title;

//subtitle(optional可选)
@property (nonatomic, copy) NSString *subtitle;









@end
