//
//  main.m
//  01_继承
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRDog.h"
#import "TRCat.h"
#import "TRPet.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRDog *dog = [[TRDog alloc] init];
        dog.name = @"旺财";
        dog.age = 8;
        dog.weight = 20;
        [dog eat];
        [dog sleep];
        [dog watchHome];
        
        TRCat *cat = [[TRCat alloc]init];
        cat.name = @"Tom";
        cat.age = 10;
        [cat eat];
        [cat sleep];
        [cat catchMouse];
        
        TRDog *dog1 = [[TRDog alloc]initWithName:@"黑贝" andAge:5 andWeight:40];
        [dog1 eat];
        [dog1 sleep];
        [dog1 watchHome];
        
        TRPet *pet = [[TRPet alloc] initWithName:@"pulot" andAge:3 andWeight:1];
        [pet bark];
    }
    return 0;
}
