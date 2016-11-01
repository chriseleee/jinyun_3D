//
//  TRMessageCell.m
//  TMessage
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMessageCell.h"

@implementation TRMessageCell
#define CELL_MARGIN_TB   4.0  //气泡上下外边距
#define CELL_MARGIN_LR   10.0  //气泡左右外边距
#define CELL_CORNOR      18.0  //气泡圆角半径
#define CELL_TAIL_WIDTH  16.0  //气泡尾巴宽度
#define MAX_WIDTH_OF_TEXT   200.0 //文字宽度限制
#define CELL_PADDING     8.0   //气泡内边距

//彩蛋:自动适配会导致self.bounds.size.width永远是320， 这里需要将代码中的替换为kWIDTH，才可以正常实现右侧显示。自行替换测试
#define kWIDTH  [UIScreen mainScreen].bounds.size.width




//当为message赋值后，就可以根据message中的信息
//计算出label和imageView的大小及位置
//然后将两个控件添加到cell内
- (void)setMessage:(TRMessage *)message{
    _message = message;
//需要根据label中的文字来计算label多大，然后根据label大小算出气泡大小，所以先要给label赋值
    self.contentLabel.text = message.content;
    if (message.fromMe) { //蓝色气泡，尾巴朝右
//发送消息，内容文字颜色为白色
        self.contentLabel.textColor = [UIColor whiteColor];
//设置泡泡背景图，需要进行切分处理
        self.popIV.image = [[UIImage imageNamed:@"message_i"] resizableImageWithCapInsets:UIEdgeInsetsMake(CELL_CORNOR, CELL_CORNOR, CELL_CORNOR, CELL_CORNOR+CELL_TAIL_WIDTH)];
//计算文本的高度，使用textRect方法
        CGRect textOfRect = [self.contentLabel textRectForBounds:CGRectMake(0, 0, MAX_WIDTH_OF_TEXT, MAXFLOAT) limitedToNumberOfLines:0];
//根据label的计算出的高度，来定义label的frame
        CGRect frameOfLabel = CGRectZero;
        frameOfLabel.size = textOfRect.size;
        frameOfLabel.origin.x = self.bounds.size.width - CELL_MARGIN_LR - CELL_TAIL_WIDTH - CELL_PADDING - textOfRect.size.width;
        frameOfLabel.origin.y = CELL_MARGIN_TB+CELL_PADDING;
        self.contentLabel.frame = frameOfLabel;
//计算气泡的frame
        CGRect frameOfPop = frameOfLabel;
        frameOfPop.origin.x -= CELL_PADDING;
        frameOfPop.origin.y -= CELL_PADDING;
        frameOfPop.size.width += 2*CELL_PADDING + CELL_TAIL_WIDTH;
        frameOfPop.size.height += 2*CELL_PADDING;
        self.popIV.frame = frameOfPop;
//设定单元格的bounds
        CGRect bounds = self.bounds;
        bounds.size.height = frameOfPop.size.height + 2*CELL_MARGIN_TB;
        self.bounds = bounds;
    }else{//灰色气泡，尾巴朝左
        self.contentLabel.textColor = [UIColor darkGrayColor];
        self.popIV.image = [[UIImage imageNamed:@"message_other"] resizableImageWithCapInsets:UIEdgeInsetsMake(CELL_CORNOR, CELL_CORNOR +CELL_TAIL_WIDTH, CELL_CORNOR, CELL_CORNOR)];
//算label的高度
        CGRect textOfRect = [self.contentLabel textRectForBounds:CGRectMake(0, 0, MAX_WIDTH_OF_TEXT, MAXFLOAT) limitedToNumberOfLines:0];
        CGRect frameOfLabel = CGRectZero;
        frameOfLabel.size = textOfRect.size;
        frameOfLabel.origin.x = CELL_MARGIN_LR +CELL_TAIL_WIDTH +CELL_PADDING;
        frameOfLabel.origin.y = CELL_MARGIN_TB +CELL_PADDING;
        self.contentLabel.frame = frameOfLabel;
//计算泡泡的frame
        CGRect frameOfPop = frameOfLabel;
        frameOfPop.origin.x = CELL_MARGIN_LR;
        frameOfPop.origin.y = CELL_MARGIN_TB;
        frameOfPop.size.width += 2*CELL_PADDING+CELL_TAIL_WIDTH;
        frameOfPop.size.height += 2*CELL_PADDING;
        self.popIV.frame = frameOfPop;
//设定单元格的bounds
        CGRect bounds = self.bounds;
        bounds.size.height = frameOfPop.size.height + 2*CELL_MARGIN_TB;
        self.bounds = bounds;
    }
    [self.contentView addSubview:self.popIV];
    [self.contentView addSubview:self.contentLabel];
}
- (UIImageView *)popIV{
    if (!_popIV) {
        _popIV = [UIImageView new];
    }
    return _popIV;
}
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.numberOfLines = 0;//自动换行
    }
    return _contentLabel;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
