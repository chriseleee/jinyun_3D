//
//  MyFirstClass.h
//  00_复习
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

struct MyStruct
{
    int i;
    char ch;
    double d;
};

@interface MyFirstClass : NSObject
{
//    int _i;
//    char _ch;
    double _d;
    NSString* str;
}
//由于访问权限的问题，类的成员变量_i在主函数中不能直接使用，所以用下面两个函数来使用变量_i
//-(void)setI:(int)i;
//-(int)i;
//-(void)setCh:(char)ch;
//-(char)ch;

@property int i;//此行语句等效于20、25、26行的语句，所以可以删除20、25、26行
@property char ch;
@property NSString* str;

-(void)method;//无参方法
-(void)setD:(double)d;//有一个参数
-(void)setD:(double)d andI:(int)i;//有两个参数，它的函数名是setD：andI：
-(void)setD:(double)d andI:(int)i andCh:(char)ch;//有多个参数

@end
                        