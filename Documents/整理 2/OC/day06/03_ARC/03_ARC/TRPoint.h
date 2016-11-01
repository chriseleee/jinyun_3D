//
//  TRPoint.h
//  03_ARC
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRPoint : NSObject
@property int x;
@property int y;
-(void)show;
-(id)initWithX:(int)x andY:(int)y;
+(id)pointWithX:(int)x andY:(int)y;
@end
