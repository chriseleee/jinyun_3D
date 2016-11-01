//
//  main.m
//  01_协议选择器
//
//  Created by tarena on 15/7/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"
#import "TRTeacher.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu = [[TRStudent alloc] init];
        //获取协议NSCopying在OC中的编号
        Protocol *p = @protocol(NSCopying);
        //判断类TRSTudent是否采纳了协议NSCopying
        if ([TRStudent conformsToProtocol:p] == YES)
        {
            TRStudent *stu1 = [stu copy];
        }
        
        TRTeacher *teacher = [[TRTeacher alloc]init];
        if ([TRTeacher conformsToProtocol:@protocol(NSCopying)] == YES)
        {
            TRTeacher *t1 = [teacher copy];
        }
    }
    return 0;
}
