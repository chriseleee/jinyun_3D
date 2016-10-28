//
//  RentBarInformationTableCell.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/29.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "RentBarInformationTableCell.h"
#import "RentBarReportM.h"
@interface RentBarInformationTableCell ()

///展示图片
@property (strong,nonatomic)UIImageView* headerImage;

///标题Label
@property (strong,nonatomic)UILabel* titleLabel;

///详情Label
@property (strong,nonatomic)UILabel * detailsLabel;


@end

@implementation RentBarInformationTableCell

-(void)setContentDic:(RentBarReportM *)contentDic{
    _contentDic = contentDic;
    [_headerImage sd_setImageWithURL:[NSURL URLWithString:contentDic.coverImg]];
    _titleLabel.text = contentDic.title;
    _detailsLabel.text = contentDic.summary;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    RentBarInformationTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[RentBarInformationTableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        [self createSubUI];
        
       
        
    }
    return self;
}


-(void)createSubUI{
    
    //展示图片
    _headerImage = [[UIImageView alloc]init];
    //标题Label
    _titleLabel = [CGTool createLabelWithFrame:CGRectZero fontColor:[UIColor color333333] fontSize:15 textAligment:NSTextAlignmentLeft];
    _titleLabel.numberOfLines = 0;
    
    //详情Label
    _detailsLabel =[CGTool createLabelWithFrame:CGRectZero fontColor:[UIColor color666666] fontSize:12 textAligment:NSTextAlignmentLeft];
    _detailsLabel.numberOfLines = 0 ;
    

    //添加到cell
    [self addSubview:_headerImage];
    [self addSubview:_titleLabel];
    [self addSubview:_detailsLabel];
    
}
#pragma make 假数据
//-(void)addData{
//    _titleLabel.text = self.contentDic[@"titleL"];
//    _detailsLabel.text = self.contentDic[@"detailsL"];
//    
//
//}

#pragma make 添加限制约束
- (void)layoutSubviews{
    [super layoutSubviews];
    
    //假数据
    
    WS(ws);
    
    [_headerImage makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.left).offset(AdjustW(14));
        make.top.equalTo(ws.top).offset(AdjustW(20));
        make.size.mas_equalTo(CGSizeMake(AdjustW(125), AdjustW(83)));
    }];
    
    CGFloat maxW = SCREEN_WIDTH - AdjustW(125+25);
    CGSize retweetContentSize = [_titleLabel.text sizeWithFont:[UIFont systemFontOfSize:15] maxW:maxW maxH:45];
    CGFloat set = 0;
    if (retweetContentSize.height>40) {
        set = 7;
    }
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headerImage.right).offset(AdjustW(15));
        make.top.equalTo(ws.top).offset(AdjustW(13-set));
        make.size.mas_equalTo(retweetContentSize);
                          
    }];
    
    [_detailsLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headerImage.right).offset(AdjustW(15));
        make.top.equalTo(_titleLabel.bottom).offset(AdjustW(8-(2*set)));
        make.bottom.equalTo(ws.bottom).offset(-AdjustW(15));
        make.right.equalTo(ws.right).offset(-AdjustW(13));
        
    }];
    
}



@end
