//
//  main.m
//  02_协议练习
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRSuperMan.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        id<TRFly, TRPerson> sMan = [[TRSuperMan alloc] init];
        [sMan fly];
        [sMan job];
    
    }
    return 0;
}
