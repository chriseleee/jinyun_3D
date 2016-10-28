//
//  MarketViewCell.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/28.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "MarketViewCell.h"
#import "MarketCellModel.h"
@interface MarketViewCell ()

///展示图片
@property (strong,nonatomic)UIImageView* headerImage;

///标题Label
@property (strong,nonatomic)UILabel* titleLabel;

///详情
@property (strong,nonatomic)UILabel* detailsLabel;

///价格
@property (strong,nonatomic)UILabel* priceLabel;

@end

@implementation MarketViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self creatUI];
        
        //假数据
//        [self addData];
    }
    return self;
}

#pragma make 假数据
-(void)addData{
    _titleLabel.text = @"HTC alive";
    _detailsLabel.text = @"UITabBarController的每个item不设title的话，那个title还是会占据着最下面那一行的位置，该怎么去隐藏它让那个位置空出来";
    _priceLabel.text = @"￥5000";
    
}


-(void)creatUI{
    
    _headerImage = [[UIImageView alloc]init];
//    _headerImage.image = [UIImage imageNamed:@"qq"];
    
    _titleLabel = [CGTool createLabelWithFrame:CGRectZero fontColor:[UIColor blackColor] fontSize:14 textAligment:NSTextAlignmentLeft];
    
    _detailsLabel = [CGTool createLabelWithFrame:CGRectZero fontColor:[UIColor blackColor] fontSize:14 textAligment:NSTextAlignmentLeft];
    _detailsLabel.numberOfLines = 0;
    
    _priceLabel = [CGTool createLabelWithFrame:CGRectZero fontColor:[UIColor redColor] fontSize:14 textAligment:NSTextAlignmentLeft];
    
    [self addSubview:_headerImage];
    [self addSubview:_titleLabel];
    [self addSubview:_detailsLabel];
    [self addSubview:_priceLabel];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    
    CGFloat cellW = (SCREEN_WIDTH-12*3)/2;
    [_headerImage makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.left);
        make.top.equalTo(ws.top);
        make.size.mas_equalTo(CGSizeMake(cellW, cellW));
    }];

    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.left).offset(12);
        make.top.equalTo(_headerImage.bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(cellW-12*2, 16));
    }];
    
    [_priceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.left).offset(12);
        make.height.equalTo(@20);
        make.bottom.equalTo(ws.bottom).offset(-10);
        make.right.equalTo(ws.right).offset(-10);
    }];
    
    [_detailsLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.left).offset(12);
        make.top.equalTo(_titleLabel.bottom).offset(5);
        make.right.equalTo(ws.right).offset(-12);
        make.bottom.equalTo(_priceLabel.top).offset(-5);
    }];
}

-(void)setContentDic:(MarketCellModel *)contentDic{
    _contentDic = contentDic;
    
    [_headerImage sd_setImageWithURL:[NSURL URLWithString:_contentDic.coverImg]];
    _titleLabel.text = _contentDic.name;
    _detailsLabel.text = _contentDic.remark;
    _priceLabel.text = _contentDic.price;
    
}

@end
