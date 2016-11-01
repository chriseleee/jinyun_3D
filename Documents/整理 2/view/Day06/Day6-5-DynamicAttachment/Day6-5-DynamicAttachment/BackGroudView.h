//
//  BackGroudView.h
//  Day6-5-DynamicAttachment
//
//  Created by tarena on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackGroudView : UIView
//公开一个贝塞尔路径，由控制器传入，作为弹簧显示
@property(nonatomic, strong) UIBezierPath *path;
@end








