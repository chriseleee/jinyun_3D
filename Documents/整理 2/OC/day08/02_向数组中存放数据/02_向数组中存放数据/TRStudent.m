//
//  TRStudent.m
//  02_向数组中存放数据
//
//  Created by tarena on 15/7/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(NSString *)description
{
    NSString *str = [NSString stringWithFormat:@"name:%@ ID:%d", self.name, self.ID];
    return str;
}
@end
