//
//  MusicCell.m
//  Day04-1-TableViewCell-Layout
//
//  Created by tarena on 15/8/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MusicCell.h"

@implementation MusicCell
//重写music的set方法，当使用cell.music =***时，会自动进入这个方法
- (void)setMusic:(TRMusic *)music{
    _music = music;
//下方就是额外自定义的内容。将music中各个属性显示在控件上
    self.nameLb.text = music.name;
//music的duration属性 是***秒，需要转换为*分*秒
    self.durationLb.text = [NSString stringWithFormat:@"%d:%02d",(int)music.duration/60,(int)music.duration%60];
    self.artistLb.text = [NSString stringWithFormat:@"%@ - %@", music.artist, music.album];
    self.onlineIV.hidden = !music.downloaded;
    self.hqIV.hidden = !music.highQuality;
}

//cell对内部的各个子视图进行布局
//layoutSubviews方法 是属于UIView的，所有继承UIView的类，都可以重写它来进行布局
- (void)layoutSubviews{
//这里一定要调父方法，否则会出问题
    [super layoutSubviews];
    CGRect frame = _durationLb.frame;
    frame.origin.x = self.bounds.size.width - _durationLb.frame.size.width - 10;
    _durationLb.frame = frame;
//设置音乐名称标签的宽度
    CGRect nameRect = _nameLb.frame;
//cell宽度-左边缘距离-时长宽度-时长右边缘距离-时长左边缘距离
    nameRect.size.width = self.bounds.size.width - nameRect.origin.x - _durationLb.frame.size.width - 10 - 10;
    _nameLb.frame = nameRect;
//第二排，根据HQ和对号是否显示，配置视图的位置
    CGFloat x = self.onlineIV.frame.origin.x;
    if (self.music.downloaded) {
        x += 20;
    }
    if (self.music.highQuality) {
        CGRect rect = self.hqIV.frame;
        rect.origin.x = x;
        self.hqIV.frame = rect;
        x += 20;
    }
    CGRect arFrame = self.artistLb.frame;
    arFrame.origin.x = x;
    arFrame.size.width = self.bounds.size.width - x -10;
    self.artistLb.frame = arFrame;
}

- (void)awakeFromNib {
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
