//
//  main.m
//  08_比较类信息
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPoint.h"
#import "TRRectangle.h"
#import "TRSquare.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRSquare *mySquare = [[TRSquare alloc] init];
        //isKindOfClass 判断mySquare是否为类TRSquare的对象，或类TRSquare的父类的对象
        if ([mySquare isKindOfClass:[TRSquare class]] == YES)
            NSLog(@"mySquare是类TRSquare的对象");
        if ([mySquare isKindOfClass:[TRRectangle class]] == YES)
            NSLog(@"mySquare是类TRRectangle的对象");
        
        //isMemberOfClass仅判断对象mySquare是否为类TRSquare的对象，不判断TRSquare的父类
        if ([mySquare isMemberOfClass:[TRSquare class]] == YES)
            NSLog(@"mySquare是类TRSquare的对象");
        if ([mySquare isMemberOfClass:[TRRectangle class]] == YES)
            NSLog(@"mySquare是类TRRectangle的对象");
        
        //判断类TRSquare是否为TRRectangle类的子类
        if ([TRSquare isSubclassOfClass:[TRRectangle class]] == YES)
            NSLog(@"类TRSquare是TRRectangle类的子类");
    }
    return 0;
}
