//
//  Area.h
//  Day12-1-HomeWork-TableTree
//
//  Created by tarena on 15/8/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Area : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *subAreas;

- (instancetype)initWithName:(NSString *)name;

+ (Area *)demoData;

@end









