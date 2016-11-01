//
//  TRMessageCell.h
//  TMessage
//
//  Created by tarena on 15-6-30.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRMessage.h"

@interface TRMessageCell : UITableViewCell

//存储要显示的TRMessage
@property(nonatomic,strong)TRMessage *message;
//显示内容的标签
@property(nonatomic,strong)UILabel *contentLabel;
//显示气泡的图片视图
@property(nonatomic,strong)UIImageView *popImageView;

@end








