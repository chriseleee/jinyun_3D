//
//  TRBook.m
//  02_集合练习
//
//  Created by tarena on 15/7/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRBook.h"

@implementation TRBook
-(id)copyWithZone:(NSZone *)zone
{
    TRBook *book = [[TRBook allocWithZone:zone]init];
    book.name = self.name;
    book.price = self.price;
    return book;
}
-(void)dealloc
{
    NSLog(@"书%@被销毁了，price：%d", self.name, self.price);
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"book name:%@,price:%d", self.name, self.price];
}
@end
