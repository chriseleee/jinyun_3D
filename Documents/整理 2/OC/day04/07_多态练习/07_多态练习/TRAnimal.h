//
//  TRAnimal.h
//  07_多态练习
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRFood.h"

@interface TRAnimal : NSObject
@property NSString *name;
-(void)eat:(TRFood*)food;
-(id)initWithName:(NSString*)name;
@end
