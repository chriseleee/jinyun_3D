//
//  TRAnimal.h
//  06_多态
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRAnimal : NSObject
@property NSString *name;
@property int age;

-(void)eat;
-(void)sleep;
-(id)initWithName:(NSString*) name andAge:(int)age;

@end
