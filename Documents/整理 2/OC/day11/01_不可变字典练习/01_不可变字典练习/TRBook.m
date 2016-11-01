//
//  TRBoo.m
//  01_不可变字典练习
//
//  Created by tarena on 15/7/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRBook.h"

@implementation TRBook
-(id)copyWithZone:(NSZone*)zone
{
    TRBook *book = [[TRBook alloc] init];
    book.name = self.name;
    book.price = self.price;
    return book;
}


@end
