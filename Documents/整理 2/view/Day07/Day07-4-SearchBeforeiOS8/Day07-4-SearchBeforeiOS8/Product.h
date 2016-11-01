//
//  Product.h
//  Day07-4-SearchBeforeiOS8
//
//  Created by tarena on 15/8/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
//定义商品类型的枚举
typedef NS_ENUM(NSInteger, ProductType) {
    ProductTypeDevice, //设备
    ProductTypeSoftware, //软件
    ProductTypeOther,   //其他
};
@interface Product : NSObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic) ProductType type;

+ (NSArray *)demoData;
@end









