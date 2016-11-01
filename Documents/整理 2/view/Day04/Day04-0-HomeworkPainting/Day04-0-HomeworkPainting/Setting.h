//
//  Setting.h
//  Day04-0-HomeworkPainting
//
//  Created by tarena on 15/8/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
//要使用UI开头的类型，必须引入系统的头文件，系统头文件用<>引入，自定义的头文件用""
#import <UIKit/UIKit.h>
//数据层，用于存储贝塞尔路径 相关属性，例如线宽，颜色是否是橡皮
@interface Setting : NSObject
@property(nonatomic, strong) UIColor *lineColor;
@property(nonatomic) CGFloat lineWidth;
//rubber  橡皮
@property(nonatomic) BOOL rubber;
@end






