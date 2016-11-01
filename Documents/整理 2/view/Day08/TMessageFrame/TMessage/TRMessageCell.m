//
//  TRMessageCell.m
//  TMessage
//
//  Created by tarena on 15-6-30.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "TRMessageCell.h"

@implementation TRMessageCell

#define CELL_MARGIN_TB      4.0     //气泡上下外边距
#define CELL_MARGIN_LR      10.0    //气泡左右外边距
#define CELL_CORNOR         18.0    //气泡圆角半径
#define CELL_TAIL_WIDTH     16.0    //气泡尾巴宽度
#define MAX_WIDTH_OF_TEXT   200.0   //文字宽度限制
#define CELL_PADDING        8.0    //气泡内边距

- (UILabel *)contentLabel{
    if(!_contentLabel){
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}
- (UIImageView *)popImageView{
    if(!_popImageView){
        _popImageView = [[UIImageView alloc]init];
    }
    return _popImageView;
}
//当为message赋值后,就可以根据messag中的信息
//计算出label和imageView的大小及位置
//然后将两个控件添加到cell内
- (void)setMessage:(TRMessage *)message{
    _message = message;
    //需要根据label的文字多少来计算label多大
    //从而计算出气泡多大,所以先要给标签赋值
    self.contentLabel.text = message.content;

    if(message.fromMe){// 蓝色气泡,尾巴朝右
        self.contentLabel.textColor = [UIColor whiteColor];
        self.popImageView.image = [[UIImage imageNamed:@"message_i"] resizableImageWithCapInsets:UIEdgeInsetsMake(CELL_CORNOR, CELL_CORNOR, CELL_CORNOR, CELL_CORNOR+CELL_TAIL_WIDTH)];
        // 1.计算label的高度
        //textRect..方法可以根据指定的最大区域
        //计算文本最终占据的实际的空间大小
        CGRect textOfRect = [self.contentLabel textRectForBounds:CGRectMake(0, 0, MAX_WIDTH_OF_TEXT, 999) limitedToNumberOfLines:0];
        //根据label的大小计算label的frame
        CGRect frameOfLabel = CGRectZero;
        frameOfLabel.size = textOfRect.size;
        frameOfLabel.origin.x = self.bounds.size.width-CELL_MARGIN_LR-CELL_TAIL_WIDTH-CELL_PADDING-textOfRect.size.width;
        frameOfLabel.origin.y = CELL_MARGIN_TB+CELL_PADDING;
        self.contentLabel.frame = frameOfLabel;
        //2.计算气泡的frame
        CGRect frameOfPop = frameOfLabel;
        frameOfPop.origin.x -= CELL_PADDING;
        frameOfPop.origin.y -= CELL_PADDING;
        frameOfPop.size.width += 2*CELL_PADDING+CELL_TAIL_WIDTH;
        frameOfPop.size.height += 2*CELL_PADDING;
        self.popImageView.frame = frameOfPop;
        //3.设定单元格的bounds
        CGRect bounds = self.bounds;
        bounds.size.height = frameOfPop.size.height+2*CELL_MARGIN_TB;
        self.bounds = bounds;
    }else{//灰色气泡,尾巴朝左
        self.contentLabel.textColor = [UIColor darkGrayColor];
        self.popImageView.image = [[UIImage imageNamed:@"message_other"] resizableImageWithCapInsets:UIEdgeInsetsMake(CELL_CORNOR, CELL_CORNOR+CELL_TAIL_WIDTH, CELL_CORNOR, CELL_CORNOR)];
        // 1.计算label的高度
        //textRect..方法可以根据指定的最大区域
        //计算文本最终占据的实际的空间大小
        CGRect textOfRect = [self.contentLabel textRectForBounds:CGRectMake(0, 0, MAX_WIDTH_OF_TEXT, 999) limitedToNumberOfLines:0];
        //根据label的大小计算label的frame
        CGRect frameOfLabel = CGRectZero;
        frameOfLabel.size = textOfRect.size;
        frameOfLabel.origin.x = CELL_MARGIN_LR+CELL_TAIL_WIDTH+CELL_PADDING;
        frameOfLabel.origin.y = CELL_MARGIN_TB+CELL_PADDING;
        self.contentLabel.frame = frameOfLabel;
        //2.计算气泡的frame
        CGRect frameOfPop = frameOfLabel;
        frameOfPop.origin.x = CELL_MARGIN_LR;
        frameOfPop.origin.y = CELL_MARGIN_TB;
        frameOfPop.size.width += 2*CELL_PADDING+CELL_TAIL_WIDTH;
        frameOfPop.size.height += 2*CELL_PADDING;
        self.popImageView.frame = frameOfPop;
        //3.设定单元格的bounds
        CGRect bounds = self.bounds;
        bounds.size.height = frameOfPop.size.height+2*CELL_MARGIN_TB;
        self.bounds = bounds;
    }
    [self.contentView addSubview:self.popImageView];
    [self.contentView addSubview:self.contentLabel];
}

@end








