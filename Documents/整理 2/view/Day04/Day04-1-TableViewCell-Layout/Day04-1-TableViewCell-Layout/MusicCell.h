//
//  MusicCell.h
//  Day04-1-TableViewCell-Layout
//
//  Created by tarena on 15/8/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRMusic.h"

@interface MusicCell : UITableViewCell
//接收Cell的数据类型，由控制器传入
@property(nonatomic, strong) TRMusic *music;

@property (weak, nonatomic) IBOutlet UILabel *nameLb; //音乐名称
@property (weak, nonatomic) IBOutlet UILabel *durationLb; //时长
@property (weak, nonatomic) IBOutlet UIImageView *onlineIV; //对号
@property (weak, nonatomic) IBOutlet UIImageView *hqIV; //HQ
@property (weak, nonatomic) IBOutlet UILabel *artistLb; //艺术家

@end








