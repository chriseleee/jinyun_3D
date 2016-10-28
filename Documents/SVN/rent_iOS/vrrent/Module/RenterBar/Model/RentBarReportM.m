//
//  RentBarReportM.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/5.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "RentBarReportM.h"
#import "RentBarReportCell.h"
@implementation RentBarReportM

//惰性初始化是这样写的
-(CGFloat)cellHeight
{
    //只在初始化的时候调用一次就Ok
    if(!_cellHeight){
        RentBarReportCell *cell=[[RentBarReportCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"report"];
        NSLog(@"我要计算高度");
        // 调用cell的方法计算出高度
        _cellHeight=[cell rowHeightWithCellModel:self];
        
    }
    
    return _cellHeight;
}

#pragma mark -- NSCoding协议方法
//归档/写
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    //对自定义类所有的属性进行编码
    [aCoder encodeObject:self.id            forKey:@"id"];
    [aCoder encodeObject:self.title          forKey:@"title"];
    [aCoder encodeObject:self.commentNum      forKey:@"commentNum"];
    [aCoder encodeObject:self.likeNum       forKey:@"likeNum"];
    [aCoder encodeObject:self.summary        forKey:@"summary"];
    [aCoder encodeObject:self.coverImg        forKey:@"coverImg"];
    [aCoder encodeObject:self.createTime      forKey:@"createTime"];
    [aCoder encodeObject:self.updateTime      forKey:@"updateTime"];
    [aCoder encodeObject:self.created_at         forKey:@"created_at"];
    
    [aCoder encodeObject:self.dynamicContent            forKey:@"dynamicContent"];
    [aCoder encodeObject:self.dynamicImgs         forKey:@"dynamicImgs"];
    [aCoder encodeObject:self.headIcon          forKey:@"headIcon"];
    [aCoder encodeObject:self.nickName       forKey:@"nickName"];
    [aCoder encodeObject:self.location        forKey:@"location"];
    [aCoder encodeObject:self.category        forKey:@"category"];
    [aCoder encodeObject:self.createBy      forKey:@"createBy"];
    [aCoder encodeObject:self.parentId      forKey:@"parentId"];
   [aCoder encodeInteger:self.type         forKey:@"type"];
    [aCoder encodeFloat:self.cellHeight forKey:@"cellHeight"];
//    dynamicContent
//    dynamicImgs;
//    headIcon;
//    nickName;
//    location;
//    category;
//    createBy;
//    parentId;
//    type;
//    cellHeight;
}

//反归档/读
- (id)initWithCoder:(NSCoder *)aDecoder {
    //对自定义类所有的属性进行解码
    if (self = [super init]) {
        self.id=[aDecoder decodeObjectForKey:@"id"];
        self.title=[aDecoder decodeObjectForKey:@"title"];
        self.commentNum=[aDecoder decodeObjectForKey:@"commentNum"];
        self.likeNum=[aDecoder decodeObjectForKey:@"likeNum"];
        self.summary=[aDecoder decodeObjectForKey:@"summary"];
        self.createTime=[aDecoder decodeObjectForKey:@"createTime"];
        self.coverImg=[aDecoder decodeObjectForKey:@"coverImg"];
        self.updateTime=[aDecoder decodeObjectForKey:@"updateTime"];
        self.created_at=  [aDecoder decodeObjectForKey:@"created_at"];
        
         self.dynamicContent  =[aDecoder decodeObjectForKey:@"dynamicContent"];
         self.dynamicImgs     =[aDecoder decodeObjectForKey:@"dynamicImgs"];
         self.headIcon        =[aDecoder decodeObjectForKey:@"headIcon"];
         self.nickName        =[aDecoder decodeObjectForKey:@"nickName"];
         self.location        =[aDecoder decodeObjectForKey:@"location"];
         self.category        =[aDecoder decodeObjectForKey:@"category"];
         self.createBy        =[aDecoder decodeObjectForKey:@"createBy"];
         self.parentId        =[aDecoder decodeObjectForKey:@"parentId"];
         self.type            =[aDecoder decodeIntegerForKey:@"type"];
         self.cellHeight      =[aDecoder decodeFloatForKey:@"cellHeight"];
        
        }
    return self;
}



@end
