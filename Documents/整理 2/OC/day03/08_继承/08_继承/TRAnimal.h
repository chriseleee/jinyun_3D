//
//  TRAnimal.h
//  08_继承
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRAnimal : NSObject
@property NSString *name;
@property int age;

-(void)eat;
-(void)sleep;
@end
