//
//  main.m
//  07_多态练习
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRFeeder.h"
#import "TRHippo.h"
#import "TRTiger.h"
#import "TRHuman.h"
#import "TRGrass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRFeeder *feeder = [[TRFeeder  alloc]init];
        TRTiger *tiger = [[TRTiger alloc] initWithName:@"跳跳虎"];
        TRHuman *human = [[TRHuman alloc] initWithName:@"喜洋洋"];
        [feeder feedForAnimal:tiger withFood:human];
        
        TRHippo *hippo = [[TRHippo alloc] initWithName:@"肥肥"];
        TRGrass *grass = [[TRGrass alloc] initWithName:@"香味草"];
        [feeder feedForAnimal:hippo withFood:grass];
    }
    return 0;
}
