//
//  TRStudent.m
//  03_Block
//
//  Created by tarena on 15/7/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(id)initWithID:(int)ID andName:(NSString *)name
{
    if (self = [super init])
    {
        self.ID = ID;
        self.name = name;
    }
    return self;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"stu ID:%d, name:%@", self.ID, self.name];
}
@end
