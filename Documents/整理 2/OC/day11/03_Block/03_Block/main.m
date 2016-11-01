//
//  main.m
//  03_Block
//
//  Created by tarena on 15/7/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"
#import "TRMyClass.h"

void func(void)
{
    printf("函数被执行了\n");
}
//无参无返回值的Block
void (^myBlock)(void) = ^(void)
{
    NSLog(@"Block被执行了");
};

void (^myBlock2)(void) = ^(void)
{
    NSLog(@"无参无返回值");
};

//有参有返回值
int (^myBlock1)(int, int) = ^int(int a, int b)
{
    return a + b;
};

int (^myBlock3)(int, int) = ^int(int a, int b)
{
    return  a - b;
};

//定义一个Block类型
typedef void(^BlockType)(void);
typedef int(^BlockType1)(char, int, int);

int g_i = 10;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        func();
        myBlock();
        myBlock2();
        NSLog(@"sum=%d", myBlock1(2,3));
        NSLog(@"sub = %d", myBlock3(5, 3));
        
        BlockType b1 = ^(void)
        {
            NSLog(@"block声明变量的定义部分被执行了");
        };
        b1();//调用Block
        
        BlockType1 b2 = ^int(char t, int a, int b)
        {
            switch (t)
            {
                case '+':
                    return  a + b;
                case '-':
                    return  a - b;
                case '*':
                    return  a * b;
                case '/':
                    if (b != 0)
                    {
                        return  a / b;
                    }
                default:
                    return  0;
            }
            //return 0;
        };
        NSLog(@"result=%d", b2('+', 2, 3));
        
        BlockType b3 = ^
        {
            NSLog(@"g_i=%d", g_i);//在Block中可以正常访问全局变量
            g_i = 20;//在Block中可以对全局变量赋值
            NSLog(@"g_i=%d", g_i);
        };
        b3();
        
        int i2 = 30;
        __block int i3 = 50;
        BlockType b4 = ^
        {
            NSLog(@"i2=%d", i2);//局部变量在Block中可以被访问
            //i2 = 40;//局部变量在Block中不能被赋值，既不能被修改
            NSLog(@"i2=%d", i2);
            
            i3 = 60;//如果希望在Block中修改局部变量的值，需要添加__block关键字
            NSLog(@"i3=%d", i3);
        };
        b4();
        
        NSArray *array = @[@"one", @"two", @"three"];
//        NSArray *sorted1 = [array sortedArrayUsingSelector:@selector(compare:)];
//        NSLog(@"sorted1:%@",sorted1);
        NSArray *sorted2 = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            NSString *str1 = obj1;
            NSString *str2 = obj2;
            return [str1 compare:str2];
        }
                            ];
        NSLog(@"sorted2:%@", sorted2);
        
        TRStudent *stu1 = [[TRStudent alloc]initWithID:2000 andName:@"zhangsan"];
        TRStudent *stu2 = [[TRStudent alloc]initWithID:1002 andName:@"lisi"];
        TRStudent *stu3 = [[TRStudent alloc]initWithID:1003 andName:@"wangwu"];
        TRStudent *stu4 = [[TRStudent alloc]initWithID:1010 andName:@"zhaoliu"];
        
        NSArray *stus = @[stu1, stu2, stu3, stu4];
        NSArray *sorted3 = [stus sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            TRStudent *stu1 = obj1;
            TRStudent *stu2 = obj2;
            if (stu1.ID > stu2.ID)
            {
                return NSOrderedDescending;
            }
            else if (stu1.ID < stu2.ID)
            {
                return NSOrderedAscending;
            }
            else
            {
                return NSOrderedSame;
            }
        }];
        NSLog(@"%@", sorted3);
        
        NSArray *sorted4 = [stus sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            TRStudent *stu1 = obj1;
            TRStudent *stu2 = obj2;
            return [stu1.name compare:stu2.name];
        }];
        NSLog(@"%@", sorted4);
        
        NSDictionary *dict = @{@"1":@"one", @"2":@"two", @"3":@"three"};
        NSArray *sorted5 = [dict keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            NSString *str1 = obj1;
            NSString *str2 = obj2;
            return [str1 compare:str2];
        }];
        NSLog(@"%@", sorted5);
        for (NSString *key in sorted5)
        {
            NSLog(@"%@:%@", key, dict[key]);
        }
        
        //Block用于方法的形参
        TRMyClass *myC = [[TRMyClass alloc]init];
        [myC method:^{
            NSLog(@"block作为实参的方法");
        }];
        [myC method1:^int(int a, int b) {
            return a + b;
        }];
        [myC method1:^int(int a, int b) {
            return a - b;
        }];
        
        //Block作为方法的返回值
        myBlock5 c = [myC getBlock];
        c();
        
        //Block作为类的属性使用
        myC.b = ^
        {
            NSLog(@"Block作为属性");
        };
        myC.b();
    }
    return 0;
}
