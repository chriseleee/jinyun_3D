//
//  TRHeaderView.m
//  TRWeather
//
//  Created by tarena on 15/9/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRHeaderView.h"
#import "UILabel+TRLabel.h"

static CGFloat inset = 20;//左右边距
static CGFloat iconHeight = 40;
static CGFloat temperatureHeight = 110;
static CGFloat statusBarHeight = 20;

@implementation TRHeaderView

//"重写"父类的initWithFrame方法
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //添加5个控件
        //城市label
        CGRect cityFrame = CGRectMake(inset, statusBarHeight, frame.size.width - 2*inset, iconHeight);
        //使用UILable分类的方式创建一个label
        self.cityLabel = [UILabel labelWithFrameByCategory:cityFrame];
        //设置一个默认文本
        self.cityLabel.text = @"Loading....";
        [self addSubview:self.cityLabel];
        
        //最高/最低温度
        CGRect hiloFrame = CGRectMake(inset, frame.size.height - iconHeight, frame.size.width - 2*inset, iconHeight);
        self.hiloLabel = [UILabel labelWithFrameByCategory:hiloFrame];
        self.hiloLabel.text = @"0˚/ 0˚";
        [self addSubview:self.hiloLabel];
        
        //当前温度lable
        CGRect temperatureFrame = CGRectMake(inset, frame.size.height - (iconHeight + temperatureHeight), frame.size.width - 2*inset, temperatureHeight);
        self.temperatureLabel = [UILabel labelWithFrameByCategory:temperatureFrame];
        self.temperatureLabel.text = @"0˚";
        [self addSubview:self.temperatureLabel];
        
        //iconView图标
        CGRect iconFrame = CGRectMake(inset, temperatureFrame.origin.y - iconHeight, iconHeight, iconHeight);
        self.iconView = [[UIImageView alloc] initWithFrame:iconFrame];
        self.iconView.contentMode = UIViewContentModeScaleAspectFit;
        self.iconView.image = [UIImage imageNamed:@"weather-clear.png"];
        [self addSubview:self.iconView];
        
        //天气描述label
        CGRect conditionFrame = CGRectMake(inset + iconHeight, iconFrame.origin.y, frame.size.width - (2*inset+iconHeight), iconHeight);
        self.conditionsLabel = [UILabel labelWithFrameByCategory:conditionFrame];
        self.conditionsLabel.text = @"Clear";
        [self addSubview:self.conditionsLabel];
    }
    
    return self;
}









@end
