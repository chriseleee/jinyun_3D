//
//  MyView.m
//  Day03-4-DrawArr
//
//  Created by tarena on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"

@interface MyView()
@property(nonatomic, strong) NSMutableArray *paths;
@end
@implementation MyView
- (NSMutableArray *)paths{
    if (!_paths) {
        _paths = [NSMutableArray new];
    }
    return _paths;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint startPoint = [touch locationInView:self];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    
    [self.paths addObject:path];
}
//当移动时，获取数组的最后一个元素，这个元素就是当前的画笔，然后向画笔添加划线操作
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    UIBezierPath *path = [self.paths lastObject];
//    path.lineWidth=20;
    [path addLineToPoint:point];
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect{
    [[UIColor redColor] setStroke];
    
    for (UIBezierPath *path in self.paths) {
//        path.lineWidth=20;
        [path stroke];
    }
}



@end










