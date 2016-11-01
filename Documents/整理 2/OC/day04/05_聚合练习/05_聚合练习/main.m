//
//  main.m
//  05_聚合练习
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRAnimal.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRHead *head = [[TRHead alloc] init];
        TRLimb *limb = [[TRLimb alloc]init];
        TRTrunk *trunk = [[TRTrunk alloc] init];
        {
            TRAnimal *animal = [[TRAnimal alloc]init];
            animal.head = head;
            animal.limb = limb;
            animal.trunk = trunk;
        }
        NSLog(@"---------");
    }
    return 0;
}
