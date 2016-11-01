//
//  TRPoint.h
//  01_有参工厂方法
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRPoint : NSObject
@property int x, y;
-(id)initWithX:(int)x andY:(int)y;
-(void)show;
+(id)pointWithX:(int)x andY:(int)y;
@end
