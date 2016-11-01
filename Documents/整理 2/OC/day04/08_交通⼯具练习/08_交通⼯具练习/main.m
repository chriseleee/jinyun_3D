//
//  main.m
//  08_交通⼯具练习
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRTransportation.h"
#import "TRTaxi.h"
#import "TRBus.h"
#import "TRBike.h"

enum TRANSPORTATIONS
{
    TRANSPORTATION,
    TAXI,
    BUS,
    BIKE,
};

TRTransportation* get(enum TRANSPORTATIONS type)
{
    switch (type)
    {
        case TRANSPORTATION:
            return [[TRTransportation alloc] init];
        case TAXI:
            return [[TRTaxi alloc]init];
        case BUS:
            return [[TRBus alloc]init];
        case BIKE:
            return [[TRBike alloc] init];
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRTransportation *tran[4];
        tran[0] = get(TRANSPORTATION);
        tran[1] = get(TAXI);
        tran[2] = get(BUS);
        tran[3] = get(BIKE);
        for (int i = 0; i < 4; i++)
        {
            [tran[i] print];
        }
    }
    return 0;
}
