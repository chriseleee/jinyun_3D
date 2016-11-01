//
//  TRCircle.h
//  06_手动内存管理
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPoint.h"

@interface TRCircle : NSObject
@property double radius;
//@property(assign) TRPoint *center;
@property(retain) TRPoint *center;
//@property(readonly) TRPoint *center;
-(id)initWithCenter:(TRPoint*)center andRadius:(double)radius;
-(void)show;
@end
