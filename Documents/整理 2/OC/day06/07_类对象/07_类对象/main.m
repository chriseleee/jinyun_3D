//
//  main.m
//  07_类对象
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"
#import "TRTeacher.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu = [[TRStudent alloc]init];
        
        if ([stu class] == [TRStudent class])
            NSLog(@"对象stu是类TRStudent的对象");
        else
            NSLog(@"对象stu不是类TRStudent的对象");
        
        if ([stu class] == [TRTeacher class])
            NSLog(@"对象stu是类TRTeacher的对象");
        else
            NSLog(@"对象stu不是类TRTeacher的对象");
    }
    return 0;
}
