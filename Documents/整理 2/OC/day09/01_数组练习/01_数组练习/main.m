//
//  main.m
//  01_数组练习
//
//  Created by tarena on 15/7/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRBook *book1 = [[TRBook alloc]init];
        book1.name = @"sanguo";
        book1.price = 20;
        TRStudent *stu1 = [TRStudent studentWithAge:18 andName:@"zhangsan" andBook:book1];
        //[stu1 print:[NSNumber numberWithInt:19] ];
        TRBook *book2 = [[TRBook alloc]init];
        book2.name = @"shuihu";
        book2.price = 18;
        TRStudent *stu2 = [TRStudent studentWithAge:19 andName:@"lisi" andBook:book2];
        TRBook *book3 = [[TRBook alloc]init];
        book3.name = @"xiyouji";
        book3.price = 28;
        TRStudent *stu3 = [TRStudent studentWithAge:20 andName:@"wangwu" andBook:book3];
        TRBook *book4 = [[TRBook alloc]init];
        book4.name = @"hongloumeng";
        book4.price = 24;
        TRStudent *stu4 = [TRStudent studentWithAge:21 andName:@"zhaoliu" andBook:book4];
        TRBook *book5 = [[TRBook alloc]init];
        book5.name = @"fengshenyanyi";
        book5.price = 22;
        TRStudent *stu5 = [TRStudent studentWithAge:22 andName:@"qianqi" andBook:book5];
        TRBook *book6 = [[TRBook alloc]init];
        book6.name = @"liaozhaizhiyi";
        book6.price = 15;
        TRStudent *stu6 = [TRStudent studentWithAge:23 andName:@"zhangfei" andBook:book6];
        TRBook *book7 = [[TRBook alloc]init];
        book7.name = @"sanxiawuyi";
        book7.price = 17;
        TRStudent *stu7 = [TRStudent studentWithAge:24 andName:@"guanyu" andBook:book7];
        TRBook *book8 = [[TRBook alloc]init];
        book8.name = @"yuefeizhuan";
        book8.price = 27;
        TRStudent *stu8 = [TRStudent studentWithAge:25 andName:@"zhaoyun" andBook:book8];
        
        //班级
        NSArray *class1 = @[stu1, stu2];
        NSArray *class2 = @[stu3, stu4];
        NSArray *class3 = @[stu5, stu6];
        NSArray *class4 = @[stu7, stu8];
        
        //学院
        NSArray *college1 = @[class1, class2];
        NSArray *college2 = @[class3, class4];
        
        //学校
        NSArray *tarena = @[college1, college2];
        NSLog(@"--------1------------");
        //1
        //遍历学校
        for (NSArray* college in tarena)
        {   //遍历学院
            for (NSArray *class in college)
            {   //遍历班级
                for (TRStudent *stu in class)
                {
                    NSLog(@"stu name:%@,age:%d", stu.name, stu.age);
                }
            }
        }
        NSLog(@"--------2、3----------");
        //2、3
        //遍历学校
        for (NSArray* college in tarena)
        {   //遍历学院
            for (NSArray *class in college)
            {   //输出class对象中的所有年龄为18岁的学生的信息
                [class makeObjectsPerformSelector:@selector(print:) withObject:[NSNumber numberWithInt:18]];//该方法将对象class中的每一个数组元素调用一遍方法print：
                //输出所有姓名为张三的学生信息
                [class makeObjectsPerformSelector:@selector(print:) withObject:@"zhangsan"];
            }
        }
        NSLog(@"-------4----------");
        //4
        //遍历学校
        for (NSArray* college in tarena)
        {   //遍历学院
            for (NSArray *class in college)
            {   //遍历班级
                for (TRStudent *stu in class)
                {
                    NSLog(@"book name:%@,price:%d", stu.book.name, stu.book.price);
                }
            }
        }
    }
    return 0;
}
