//
//  TRMessageCell.h
//  TMessage
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRMessage.h"
@interface TRMessageCell : UITableViewCell
//接收传递过来的 TRMessage对象
@property(nonatomic,strong) TRMessage *message;
//气泡图片
@property(nonatomic,strong) UIImageView *popIV;
//内容标签
@property(nonatomic,strong) UILabel *contentLabel;
@end






