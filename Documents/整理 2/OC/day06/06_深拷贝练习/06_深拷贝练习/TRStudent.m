//
//  TRStudent.m
//  06_深拷贝练习
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(void)study
{
    NSLog(@"学生age:%d 正在学习price:%d的书中的知识", self.age, self.book.price);
}
@end
