//
//  TRDeal.h
//  TRFindDeals
//
//  Created by tarena on 15/9/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRDeal : NSObject

/**不同:
 1. 在该文件下声明的属性的名字需要和服务器返回的key要一模一样
 2. 如果遇到有OC中的关键字，需要改成其他的(description--->desc)
 3. 遇到第2中情况，必须手动来绑定description和desc，必须要实现setValue:forUndefinedKey:方法
 */
@property (nonatomic, strong) NSString *title;
//订单的描述
@property (nonatomic, strong) NSString *desc;
//原始价格
@property (nonatomic, strong) NSNumber *list_price;
//优惠后的价格
@property (nonatomic, strong) NSNumber *current_price;
//购买数量
@property (nonatomic, strong) NSNumber *purchase_count;
//团购订单图片url
@property (nonatomic, strong) NSString *image_url;
@property (nonatomic, strong) NSString *s_image_url;
//商户属性(定大头针)
@property (nonatomic, strong) NSArray *businesses;
@property (nonatomic, strong) NSArray *categories;
//html url
@property (nonatomic, strong) NSString *deal_h5_url;












@end
