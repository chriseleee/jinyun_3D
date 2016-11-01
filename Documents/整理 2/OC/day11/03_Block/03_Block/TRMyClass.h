//
//  TRMyClass.h
//  03_Block
//
//  Created by tarena on 15/7/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^myBlock5)(void);
typedef int(^myBlock6)(int, int);

@interface TRMyClass : NSObject
@property (strong) myBlock5 b;
-(void)method:(myBlock5)b;
-(void)method1:(myBlock6)b;
-(myBlock5)getBlock;
@end
