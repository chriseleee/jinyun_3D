//
//  TRBook.m
//  01_数组练习
//
//  Created by tarena on 15/7/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRBook.h"

@implementation TRBook
-(id)copyWithZone:(NSZone *)zone
{
    TRBook *book = [[TRBook allocWithZone:zone] init];
    book.name = self.name;
    book.price = self.price;
    return  book;
}
-(void)dealloc
{
    NSLog(@"书%@被销毁了price:%d", self.name, self.price);
    //[super dealloc];//ARC禁止使用dealloc
}
@end
