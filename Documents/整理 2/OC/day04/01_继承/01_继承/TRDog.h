//
//  TRDog.h
//  08_继承
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRAnimal.h"

@interface TRDog : TRAnimal
@property int weight;
-(void)watchHome;//扩展的自己的特性
-(id)initWithName:(NSString *)name andAge:(int)age andWeight:(int)weight;
-(void)bark;
@end
