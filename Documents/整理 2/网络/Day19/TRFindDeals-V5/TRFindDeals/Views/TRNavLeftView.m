//
//  TRNavLeftView.m
//  TRFindDeals
//
//  Created by tarena on 15/9/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRNavLeftView.h"

@implementation TRNavLeftView


+ (id)view {
    //从xib加载视图
    return [[[NSBundle mainBundle] loadNibNamed:@"TRNavLeftView" owner:nil options:nil] firstObject];
}

//重写方法, 禁止横屏情况的自动拉伸
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.autoresizingMask = UIViewAutoresizingNone;
    }
    return self;
}







@end
