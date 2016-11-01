//
//  TRcat.m
//  01_继承
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRCat.h"

@implementation TRCat
-(void)catchMouse
{
    NSLog(@"猫咪%@在抓老鼠", self.name);
}
-(void)eat//重写基类中的函数后，派生类中会有两个eat，子类中重写的eat将被优先调用
{
    NSLog(@"猫咪%@在吃鱼", self.name);
}
@end
