//
//  DownloadView.h
//  Day01-9-DownLoadView
//
//  Created by tarena on 15/8/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadView : UIView
//当前下载进度，0~1之间的浮点数
//下载的圆圈会随着这个值的变化而变
@property (nonatomic) CGFloat progressValue;

//定制提示圆环的颜色， 不指定时用蓝色
@property (nonatomic, strong) UIColor *progressColor;
@end










