//
//  TRBook.m
//  06_深拷贝练习
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRBook.h"

@implementation TRBook
-(id)copyWithZone:(NSZone*)zone
{
    TRBook *book = [[TRBook allocWithZone:zone]init];
    book.price = self.price;
    return book;
}
-(void)dealloc
{
    NSLog(@"书对象销毁了，price:%d", self.price);
}
@end
