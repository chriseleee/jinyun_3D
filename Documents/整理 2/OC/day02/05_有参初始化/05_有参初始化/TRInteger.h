//
//  TRInteger.h
//  05_有参初始化
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRInteger : NSObject
@property int integer;
-(id)initWithInteger:(int)i;//带参初始化必须有声明
-(void)show;
@end
