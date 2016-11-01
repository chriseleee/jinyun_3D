//
//  TRFraction.m
//  02_扩展
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRFraction.h"
#import "TRFraction_myExtension.h"

//定义一个扩展
@interface TRFraction ()
@property int value;//私有属性
-(void)extensionMethod;//私有方法
@end

@implementation TRFraction
-(void)show
{
    NSLog(@"%d/%d", self.numerator, self.denominator);
    [self extensionMethod];//只有主类中的方法，才能调用扩展中声明的方法
    [self extensionMethod1];
}
-(void)extensionMethod//扩展中声明的方法只能在主类的.m文件中实现，不能分开
{
    NSLog(@"扩展方法");
}
-(void)extensionMethod1
{
    NSLog(@"扩展方法1");
}
@end
