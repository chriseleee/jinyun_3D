//
//  TRAnimal.m
//  08_继承
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRAnimal.h"

@implementation TRAnimal
-(void)eat
{
    NSLog(@"动物%@正在吃", self.name);
}
-(void)sleep
{
    NSLog(@"动物%@正在睡", self.name);
}
@end
