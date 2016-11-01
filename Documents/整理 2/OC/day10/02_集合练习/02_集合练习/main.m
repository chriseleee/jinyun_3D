//
//  main.m
//  02_集合练习
//
//  Created by tarena on 15/7/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRBook *book1 = [[TRBook alloc]init];
        book1.name = @"sanguo";
        book1.price = 20;
        TRStudent *stu1 = [[TRStudent alloc] initWithAge:18 andName:@"zhangsan" andBook:book1];
        TRBook *book2 = [[TRBook alloc]init];
        book2.name = @"shuihu";
        book2.price = 18;
        TRStudent *stu2 = [[TRStudent alloc] initWithAge:19 andName:@"lisi" andBook:book2];
        TRBook *book3 = [[TRBook alloc]init];
        book3.name = @"xiyouji";
        book3.price = 28;
        TRStudent *stu3 = [[TRStudent alloc] initWithAge:20 andName:@"wangwu" andBook:book3];
        TRBook *book4 = [[TRBook alloc]init];
        book4.name = @"hongluomeng";
        book4.price = 24;
        TRStudent *stu4 = [[TRStudent alloc] initWithAge:18 andName:@"zhaoliu" andBook:book4];
        TRBook *book5 = [[TRBook alloc]init];
        book5.name = @"fengshenyanyi";
        book5.price = 22;
        TRStudent *stu5 = [[TRStudent alloc] initWithAge:22 andName:@"qianqi" andBook:book5];
        TRBook *book6 = [[TRBook alloc]init];
        book6.name = @"liaozhaizhiyi";
        book6.price = 15;
        TRStudent *stu6 = [[TRStudent alloc] initWithAge:23 andName:@"zhangfei" andBook:book6];
        TRBook *book7 = [[TRBook alloc]init];
        book7.name = @"sanxiawuyi";
        book7.price = 17;
        TRStudent *stu7 = [[TRStudent alloc] initWithAge:24 andName:@"guanyu" andBook:book7];
        TRBook *book8 = [[TRBook alloc]init];
        book8.name = @"yuefeizhuan";
        book8.price = 27;
        TRStudent *stu8 = [[TRStudent alloc] initWithAge:25 andName:@"zhaoyun" andBook:book8];
        
        //班级
        NSSet *class1 = [NSSet setWithObjects:stu1, stu2, nil];
        NSSet *class2 = [NSSet setWithObjects:stu3, stu4, nil];
        NSSet *class3 = [NSSet setWithObjects:stu5, stu6, nil];
        NSSet *class4 = [NSSet setWithObjects:stu7, stu8, nil];
        
        //学院
        NSSet *college1 = [NSSet setWithObjects:class1, class2, nil];
        NSSet *college2 = [NSSet setWithObjects:class3, class4, nil];
        
        //学校
        NSSet *tarena = [NSSet setWithObjects:college1, college2, nil];
        //显示所有学生信息
        NSLog(@"-----显示所有学生信息-----");
        for (NSSet *college in tarena)
        {
            for (NSSet *class in college)
            {
                for (TRStudent *stu in class)
                {
                    NSLog(@"%@", stu);
                }
            }
        }
        //只显示姓名为张三的学生信息
        NSLog(@"--只显示姓名为张三的学生信息--");
        for (NSSet *college in tarena)
        {
            for (NSSet *class in college)
            {
                [class makeObjectsPerformSelector:@selector(print:) withObject:@"zhangsan"];
            }
        }
        //只显示年龄为18的学生信息
        NSLog(@"--只显示年龄为18的学生信息--");
        for (NSSet *college in tarena)
        {
            for (NSSet *class in college)
            {
                [class makeObjectsPerformSelector:@selector(print:) withObject:[NSNumber numberWithInt:18]];
            }
        }
        //显示每个学生正在学习的书的名称和价格
        NSLog(@"-----书的名称和价格-----");
        for (NSSet *college in tarena)
        {
            for (NSSet *class in college)
            {
                for (TRStudent *stu in class)
                {
                    NSLog(@"%@", stu.book);
                }
            }
        }
        
    }
    return 0;
}
