//
//  TRFeeder.h
//  07_多态练习
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRAnimal.h"
#import "TRFood.h"

@interface TRFeeder : NSObject
-(void)feedForAnimal:(TRAnimal*)animal withFood:(TRFood*)food;
@end
