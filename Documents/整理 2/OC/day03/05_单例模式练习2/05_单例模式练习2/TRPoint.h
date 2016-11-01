//
//  TRPoint.h
//  05_单例模式练习2
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRPoint : NSObject
@property int x, y;
-(void)show;
+(id)sharedPoint;
@end
