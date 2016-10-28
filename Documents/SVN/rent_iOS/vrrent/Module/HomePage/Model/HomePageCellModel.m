//
//  HomePageCellModel.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/6.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "HomePageCellModel.h"

@implementation HomePageCellModel
+ (NSDictionary *)replacedkeyFromPropertyName{
    return @{
             @"MyID" : @"id"
             };
}
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key  {
//    if([key isEqualToString:@"id"])
////        self.myID = value;
//}

#pragma mark -- NSCoding协议方法
//归档/写
- (void)encodeWithCoder:(NSCoder *)aCoder {
    //对自定义类所有的属性进行编码
    [aCoder encodeObject:self.id            forKey:@"id"];
    [aCoder encodeObject:self.name          forKey:@"name"];
    [aCoder encodeObject:self.dayprice      forKey:@"dayprice"];
    [aCoder encodeObject:self.leftNum       forKey:@"leftNum"];
    [aCoder encodeObject:self.remark        forKey:@"remark"];
    [aCoder encodeObject:self.source        forKey:@"source"];
    [aCoder encodeObject:self.coverImg      forKey:@"coverImg"];
    [aCoder encodeObject:self.platform      forKey:@"platform"];
    [aCoder encodeInteger:self.sort         forKey:@"sort"];
    [aCoder encodeInteger:self.refreshRate  forKey:@"refreshRate"];
    [aCoder encodeObject:self.created_at    forKey:@"created_at"];
    [aCoder encodeObject:self.parentId      forKey:@"parentId"];
    [aCoder encodeInteger:self.type         forKey:@"type"];

}

//反归档/读
- (id)initWithCoder:(NSCoder *)aDecoder {
    //对自定义类所有的属性进行解码
    if (self = [super init]) {
       
        self.id=[aDecoder decodeObjectForKey:@"id"];
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.dayprice=[aDecoder decodeObjectForKey:@"dayprice"];
        self.leftNum=[aDecoder decodeObjectForKey:@"leftNum"];
        self.remark=[aDecoder decodeObjectForKey:@"remark"];
        self.source=[aDecoder decodeObjectForKey:@"source"];
        self.coverImg=[aDecoder decodeObjectForKey:@"coverImg"];
        self.platform=[aDecoder decodeObjectForKey:@"platform"];
        self.sort=  [aDecoder decodeIntegerForKey:@"sort"];

        self.refreshRate=[aDecoder decodeIntegerForKey:@"refreshRate"];

        self.created_at  =[aDecoder decodeObjectForKey:@"created_at"];
        self.parentId   =[aDecoder decodeObjectForKey:@"parentId"];
        self.type=[aDecoder decodeIntegerForKey:@"type"];
    }
    return self;
}


@end
