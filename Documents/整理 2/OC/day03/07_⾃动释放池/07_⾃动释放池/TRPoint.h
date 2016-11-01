//
//  TRPoint.h
//  07_⾃动释放池
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRPoint : NSObject
@property int x, y;
-(id)initWithX:(int)x andY:(int)y;
+(id)pointWithX:(int)x andY:(int)y;
-(void)show;
@end
