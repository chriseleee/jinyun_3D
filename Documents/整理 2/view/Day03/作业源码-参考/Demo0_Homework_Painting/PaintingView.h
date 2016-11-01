//
//  PaintingView.h
//  Demo0_Homework_Painting
//
//  Created by tarena on 15/4/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setting.h"

//自定义的视图类
//由于这个视图类能够从控制器中接受界面上用户的
//的设置选项  所以公开一个属性 来接收
// 界面上设置选择
@interface PaintingView : UIView
@property(nonatomic,strong)Setting *currentSetting;
@end





