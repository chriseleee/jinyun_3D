//
//  MyCollectionViewCell.m
//  Day12-4-CollectionCode
//
//  Created by tarena on 15/8/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _backGroundIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self.contentView addSubview:_backGroundIV];
        
        _textLabel = [[UILabel alloc] initWithFrame:frame];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = [UIFont systemFontOfSize:35];
        [self.contentView addSubview:_textLabel];
    }
    return self;
}







@end
