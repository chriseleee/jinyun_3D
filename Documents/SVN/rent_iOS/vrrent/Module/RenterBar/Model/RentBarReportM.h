//
//  RentBarReportM.h
//  vrrent
//
//  Created by 龚俊平 on 16/5/5.
//  Copyright © 2016年 golden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RentBarReportM : NSObject<NSCoding>
/******************************information*****************/
/**	string	字符串型ID*/
@property (nonatomic, copy) NSString*   id;

/**	string	名称*/
@property (nonatomic, copy) NSString*   title;

/**	string   评论数*/
@property (nonatomic, copy) NSString*   commentNum;

/**	string	点赞数*/
@property (nonatomic, copy) NSString*   likeNum;
/**	string	内容*/
@property (nonatomic, copy) NSString*   summary;

/**	string	image的url*/
@property (nonatomic, copy) NSString*   coverImg;

/**  createTime */
@property (copy,nonatomic)NSString*     createTime;

/**  updateTime */
@property (copy,nonatomic)NSString*     updateTime;

/**	string	微博创建时间*/
@property (nonatomic,copy)NSString*     created_at;


/******************************report*****************/


/**	string	详情内容*/
@property (nonatomic, copy) NSString *dynamicContent;

/**	string  图片地址 dynamicImgs*/
@property (nonatomic, copy) NSString *dynamicImgs;

/**	string	headIcon URL*/
@property (nonatomic, copy) NSString* headIcon;
/**	string	nickName*/
@property (nonatomic, copy) NSString *nickName;

/**	string	location*/
@property (nonatomic, copy) NSString *location;

/**	string  category*/
@property (nonatomic, copy) NSString *category;

/**	string	createBy */
@property (nonatomic, copy) NSString* createBy;


/**
 *  用来确定品牌
 */
@property (nonatomic, copy) NSString * parentId;

/**
 *  用来确定是否是品牌
 */
@property (assign,nonatomic)NSInteger  type;

//单元格的高度
@property (nonatomic,assign) CGFloat    cellHeight;

@end
