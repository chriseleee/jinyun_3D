//
//  main.m
//  08_类⽅法
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRExample.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRExample *e = [[TRExample alloc] init];
        [e show];//用对象调用实例方法
        //[e classMethod];//对象不能调用类方法
        
        [TRExample classMethod];//使用类名调用类方法
        //[TRExample show];//类名不能调用实例方法
    }
    return 0;
}
