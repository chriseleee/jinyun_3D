//
//  Contact.h
//  Day09-4-LianXiRen
//
//  Created by tarena on 15/8/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *address;

//类方法，返回一个数组，数组中是联系人对象
+(NSArray *)contactArr;

@end








