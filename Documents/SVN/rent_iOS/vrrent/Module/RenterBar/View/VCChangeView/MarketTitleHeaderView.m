//
//  MarketTitleHeaderView.m
//  TradeBook
//
//  Created by clark on 15/12/15.
//  Copyright © 2015年 ethan. All rights reserved.
//

#import "MarketTitleHeaderView.h"

//底部蓝色下滑线宽度多出按钮长度
#define marginWithBottomLine 10
//底部蓝色下滑线与左右间距
#define marginWithLeftAndRightEdge 30
//增大点击范围 给button增加宽度
#define addButtonWidth 20


@interface MarketTitleHeaderView ()
/**
 *  标题总宽度
 */
@property (nonatomic,assign)CGFloat totalWidth;

@end

@implementation MarketTitleHeaderView

#pragma mark 事件处理


#pragma mark 懒加载与初始化相关

/**
 *  底部蓝色下划线
 */
-(UIView *)bottomBlueLineView
{
    if (_bottomBlueLineView == nil) {
        _bottomBlueLineView = [[UIView alloc] init];
        _bottomBlueLineView.backgroundColor = UIColorFromRGBAS(0x308fff, 1);
    }
    return _bottomBlueLineView;
}

/**
 *  分隔线
 */
-(UIView *)separateLine
{
    if (_separateLine == nil) {
        _separateLine = [[UIView alloc] init];
        _separateLine.backgroundColor = UIColorFromRGBAS(0xd9d9d9, 1);
    }
    return _separateLine;
}

/**
 *  初始化
 *
 *  @param arr 按钮名称数组
 */
-(instancetype)initWithFrame:(CGRect)frame titleName:(NSArray *)arr
{
    if (self = [super initWithFrame:frame]) {
        _totalWidth = 0.0;
        if (arr.count) {
            self.titleBtnArr = [NSArray arrayWithArray:arr];
            for (int i = 0; i < arr.count; i++) {
                _totalWidth += [NSString calculteStringSize:arr[i] fontSize:AdjustFontSize(14)].width;
            }
        }
        [self addSubview:self.separateLine];
        [self addSubview:self.bottomBlueLineView];
    }
    return self;
}

#pragma mark 约束布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    WS(ws);
    
    //按钮
    if (_titleBtnArr.count && _beSelectedBtn == nil) {
        CGFloat buttonX = 35;
        CGFloat titleWidth = 0;
        CGFloat marginWithBtn = (SCREEN_WIDTH - 35 * 2 - _totalWidth)/(_titleBtnArr.count - 1);
        for (int i = 0; i<_titleBtnArr.count; i++) {
            MarketTitleButton *btn = [[MarketTitleButton alloc] initWithTitle:_titleBtnArr[i]];
            titleWidth = [NSString calculteStringSize:_titleBtnArr[i] fontSize:AdjustFontSize(14)].width;
            btn.frame = CGRectMake(buttonX-addButtonWidth*0.5, 0, titleWidth+addButtonWidth, self.frame.size.height);
            buttonX += titleWidth + marginWithBtn;
            btn.tag = 1000 + i;
            
            //默认选中第一个
            if (!self.beSelectedBtn) {
                btn.selected = YES;
                _beSelectedBtn = btn;
                _selectedIndex = btn.tag - 1000;
            }
            [self addSubview:btn];

            __block MarketTitleButton *button = btn;
            btn.marketTitleBtnBeClick = ^(NSInteger index){
                if (_selectedIndex!= index && index < _titleBtnArr.count)
                {
                    button.selected= ws.beSelectedBtn.selected;
                    ws.beSelectedBtn.selected = !ws.beSelectedBtn.selected;
                    ws.beSelectedBtn = button;
                    if (ws.delegate && [ws.delegate respondsToSelector:@selector(changeVCformIndex:toIndex:)]) {
                        [ws.delegate changeVCformIndex:_selectedIndex toIndex:index];
                    }
                    [UIView animateWithDuration:0.25f animations:^{
                        CGRect rect = ws.bottomBlueLineView.frame;
                        rect.size.width = button.frame.size.width + marginWithBottomLine - addButtonWidth;
                        ws.bottomBlueLineView.frame = rect;
                        CGFloat changeW = button.frame.origin.x-marginWithBottomLine/2 - marginWithLeftAndRightEdge + addButtonWidth*0.5;
                        ws.bottomBlueLineView.transform = CGAffineTransformMakeTranslation(changeW, 0);
                    }];
                    _selectedIndex = index;
                }
            };
        }
    }
    
    //底部蓝色下滑线
    [self.bottomBlueLineView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1.5);
        make.top.equalTo(ws.mas_bottom).equalTo(@(-1.5));
        make.width.equalTo(ws.beSelectedBtn.mas_width).offset(marginWithBottomLine - addButtonWidth);
        make.centerX.equalTo(ws.beSelectedBtn.mas_centerX);
    }];
    
    //底部分隔线
    [self.separateLine makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.bottom.equalTo(ws.mas_bottom);
        make.height.equalTo(@0.5);
    }];
}
@end
