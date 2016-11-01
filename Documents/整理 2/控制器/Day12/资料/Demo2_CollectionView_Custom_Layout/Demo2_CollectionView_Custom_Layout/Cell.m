//
//  Cell.m
//  Demo2_CollectionView_Custom_Layout
//
//  Created by xiaoz on 15/1/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.label.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont boldSystemFontOfSize:50.0];
        self.label.textColor = [UIColor blackColor];
        //self.label.backgroundColor = [UIColor lightGrayColor];
        self.bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.backgroundView = self.bgImageView;
        [self.contentView addSubview:self.label];
        self.contentView.layer.borderWidth = 1.0f;
        self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return  self;
}

@end
