//
//  main.m
//  09_方法选择器
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu = [[TRStudent alloc]init];
        stu.ID = 1506001;
        stu.name = @"zhangsan";
        
        //获取TRStudent类中study方法的编号
        SEL sel = @selector(study);
        //判断类TRStudent中是否存在study方法
        if ([TRStudent instancesRespondToSelector:sel] == YES)
            NSLog(@"TRStudent类中存在study方法");
        else
            NSLog(@"TRStudent类中不存在study方法");
        if ([TRStudent instancesRespondToSelector:@selector(learn)] == YES)
            NSLog(@"TRStudent类中存在learn方法");
        else
            NSLog(@"TRStudent类中不存在learn方法");
        
        //判断对象stu能否调用study方法
        if ([stu respondsToSelector:sel] == YES)
            NSLog(@"stu对象可以调用study方法");
        else
            NSLog(@"stu对象不可以调用study方法");
    }
    return 0;
}
