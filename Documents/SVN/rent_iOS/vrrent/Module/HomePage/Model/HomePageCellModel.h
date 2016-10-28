//
//  HomePageCellModel.h
//  vrrent
//
//  Created by 龚俊平 on 16/5/6.
//  Copyright © 2016年 golden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomePageCellModel : NSObject <NSCoding>

/**	string	字符串型ID*/
@property (nonatomic, copy) NSString *id;

/**	string	名称*/
@property (nonatomic, copy) NSString *name;

/**	string   租金*/
@property (nonatomic, copy) NSString *dayprice;

/**	string	剩余数量*/
@property (nonatomic, copy) NSString *leftNum;

@property (strong,nonatomic)NSString* remark;

/**	string	来源*/
@property (nonatomic, copy) NSString *source;

/**	string	image的url*/
@property (nonatomic, copy) NSString *coverImg;

/**	string	平台*/
@property (nonatomic, copy) NSString *platform;

/**  sort排序 */
@property (assign,nonatomic)NSInteger sort;

/**  刷新率 */
@property (assign,nonatomic)NSInteger refreshRate;

/**	string	微博创建时间*/
@property (nonatomic, copy) NSString *created_at;

/**
 *  用来确定品牌
 */
@property (nonatomic, copy) NSString * parentId;

/**
 *  用来确定是否是品牌
 */
@property (assign,nonatomic)NSInteger type;

@end
