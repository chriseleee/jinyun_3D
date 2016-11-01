//
//  TRPoint.h
//  07_self关键字
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRPoint : NSObject
@property int x, y;
-(id)initWithX:(int)x andY:(int)y;
-(void)setX:(int)x andY:(int)y;
-(void)show;
@end
