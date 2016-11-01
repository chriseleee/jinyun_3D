//
//  DrawPath.h
//  Demo0_Homework_Painting
//
//  Created by tarena on 15/4/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Setting.h"

//自定义的路径类型
//包含两部分
//path属性用于存储路径的内容
//setting属性用于存储该路径的设置选项,如颜色线宽等...
@interface DrawPath : NSObject

@property(nonatomic,strong)UIBezierPath *path;
@property(nonatomic,strong)Setting *setting;
@end








