//
//  TRHeaderView.h
//  TRWeather
//
//  Created by tarena on 15/9/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRHeaderView : UIView

//城市label
@property (nonatomic, strong) UILabel *cityLabel;
//天气图标
@property (nonatomic, strong) UIImageView *iconView;
//描述天气情况
@property (nonatomic, strong) UILabel *conditionsLabel;
//当前的温度值
@property (nonatomic, strong) UILabel *temperatureLabel;
//最高/最低温度
@property (nonatomic, strong) UILabel *hiloLabel;


















@end
