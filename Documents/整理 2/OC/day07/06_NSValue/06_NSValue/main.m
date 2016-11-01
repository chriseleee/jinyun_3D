//
//  main.m
//  06_NSValue
//
//  Created by tarena on 15/7/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

struct TRPoint
{
    int x;
    int y;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct TRPoint point;
        point.x = 10;
        point.y = 20;
        //将一个结构体变量封装成NSValue对象
        SEL sel = @selector(study);
        NSValue *value = [NSValue valueWithBytes:&point objCType:@encode(struct TRPoint)];
        NSLog(@"%@", value);//不能用%@输出NSValue对象的值
        //拆封
        struct TRPoint point1;
        [value getValue:&point1];
        NSLog(@"%d,%d", point1.x, point1.y);
    }
    return 0;
}
