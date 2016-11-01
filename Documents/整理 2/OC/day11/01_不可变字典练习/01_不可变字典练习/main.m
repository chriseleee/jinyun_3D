//
//  main.m
//  01_不可变字典练习
//
//  Created by tarena on 15/7/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRBook *book1 = [[TRBook alloc]init];
        book1.name = @"sanguo";
        book1.price = 20;
        TRStudent *stu1 = [[TRStudent alloc]initWithAge:18 andName:@"zhangsan" andBook:book1];
        TRBook *book2 = [[TRBook alloc]init];
        book2.name = @"shuihu";
        book2.price = 18;
        TRStudent *stu2 = [[TRStudent alloc]initWithAge:19 andName:@"lisi" andBook:book2];
        TRBook *book3 = [[TRBook alloc]init];
        book3.name = @"xiyouji";
        book3.price = 28;
        TRStudent *stu3 = [[TRStudent alloc]initWithAge:20 andName:@"wangwu" andBook:book3];
        TRBook *book4 = [[TRBook alloc]init];
        book4.name = @"hongloumeng";
        book4.price = 24;
        TRStudent *stu4 = [[TRStudent alloc]initWithAge:21 andName:@"zhaoliu" andBook:book4];
        TRBook *book5 = [[TRBook alloc]init];
        book5.name = @"fengshenyanyi";
        book5.price = 22;
        TRStudent *stu5 = [[TRStudent alloc]initWithAge:22 andName:@"qianqi" andBook:book5];
        TRBook *book6 = [[TRBook alloc]init];
        book6.name = @"liaozhaizhiyi";
        book6.price = 15;
        TRStudent *stu6 = [[TRStudent alloc]initWithAge:23 andName:@"zhangfei" andBook:book6];
        TRBook *book7 = [[TRBook alloc]init];
        book7.name = @"sanxiawuyi";
        book7.price = 17;
        TRStudent *stu7 = [[TRStudent alloc]initWithAge:24 andName:@"guanyu" andBook:book7];
        TRBook *book8 = [[TRBook alloc]init];
        book8.name = @"yuefeizhuan";
        book8.price = 27;
        TRStudent *stu8 = [[TRStudent alloc]initWithAge:25 andName:@"zhaoyun" andBook:book8];
        
        //班级
        NSDictionary *class1 = @{@"1":stu1, @"2":stu2};
        NSDictionary *class2 = @{@"1":stu3, @"2":stu4};
        NSDictionary *class3 = @{@"1":stu5, @"2":stu6};
        NSDictionary *class4 = @{@"1":stu7, @"2":stu8};
        
        //学院
        NSDictionary *college1 = @{@"1":class1, @"2":class2};
        NSDictionary *college2 = @{@"1":class3, @"2":class4};
        
        //学校
        NSDictionary *tarena = @{@"1":college1, @"2":college2};

        for (NSString *college in tarena)
        {
            for (NSString *class in tarena[college])
            {
                for (NSString *stu in (tarena[college])[class])
                {
                    NSLog(@"%@", (tarena
                          [college][class])[stu]);
                }
            }
        }
        for (NSString *college in tarena)
        {
            for (NSString *class in tarena[college])
            {
                for (NSString *stu in tarena[college][class])
                {
                    [tarena[college][class][stu] print:[NSNumber numberWithInt:18]];
                }
            }
        }
        NSDictionary* clss1=@{@"1":stu1,@"2":stu2};
        NSDictionary*clss2 =@{@"3":stu3,@"4":stu4};
        NSDictionary* clss3=@{@"5":stu5,@"6":stu6};
        NSDictionary* clss4 =@{@"7":stu7,@"8":stu8};
        
        NSDictionary* collge1 = @{@"1":class1,@"2":class2};
        NSDictionary* collge2 =@{@"3":class3,@"4":class4};
        NSLog(@"**************************************");
        NSDictionary* tarna =@{@"1":college1,@"2":college2};
        for (NSDictionary* college in tarna) {
            for (NSDictionary* class in tarna[college]) {
                for (NSDictionary* student in tarna[college][class]) {
                    NSLog(@"%@:%@",student,tarna[college][class][student]);
                }
            }
        }
        for (NSDictionary* college in tarna) {
            for (NSDictionary* class in tarna[college]) {
            
                [[tarna[college][class] allValues] makeObjectsPerformSelector:@selector(print:) withObject:@"lisi"];
                               
            }
        }
        for (NSDictionary* college in tarna) {
            for (NSDictionary* class in tarna[college]) {
                for (NSDictionary* student in tarna[college][class]) {
                    [tarna[college][class][student] print:[NSNumber numberWithInt:18]];
                }
            }
        }


    }
    return 0;
}
