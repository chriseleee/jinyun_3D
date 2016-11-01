//
//  Cell.m
//  Demo4_Custom_Layout
//
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Cell.h"

@implementation Cell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [[UIColor whiteColor]CGColor];
        self.layer.borderWidth = 1;
    }
    return self;
}
@end
