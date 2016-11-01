//
//  PaintingView.h
//  Day04-0-HomeworkPainting
//
//  Created by tarena on 15/8/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setting.h"

@interface PaintingView : UIView
//由于这个视图类能够从视图控制器中接受界面上用户的设置选项，所以公开一个属性用于接收界面上的设置选择
@property(nonatomic,strong) Setting *currentSetting;
@end





