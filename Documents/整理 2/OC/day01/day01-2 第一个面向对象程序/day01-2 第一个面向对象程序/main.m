//
//  main.m
//  day01-2 第一个面向对象程序
//
//  Created by tarena on 15/2/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //实例化 堆
        //id void* 万能指针(任意类型指针)
        /*
        id obj = [Student alloc];
        Student* stu = (Student*)obj;
         */
        //Student alloc实例化
        //stu***对象、**实例、指针、*引用
        Student* stu = [Student alloc];
        //对象.属性 给属性赋值
        stu.age = 18;
        [stu study];//调用方法
        NSLog(@"stu:%p",stu);
        
    }
    return 0;
}





