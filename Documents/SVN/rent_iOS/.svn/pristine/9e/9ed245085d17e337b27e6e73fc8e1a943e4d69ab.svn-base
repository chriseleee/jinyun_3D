//
//  HomePageTableViewCell.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/28.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "HomePageTableViewCell.h"
#import "HomePageCellModel.h"
@interface HomePageTableViewCell ()

///展示图片
@property (strong,nonatomic)UIImageView* headerImage;

///标题Label
@property (strong,nonatomic)UILabel* titleLabel;
///平台Label/个人
@property (strong,nonatomic)UILabel* exhibitorLabel;

///个人头像
@property (strong,nonatomic)UIImageView* personalImage;

///详情Label
@property (strong,nonatomic)UILabel * detailsLabel;

///剩余个数
@property (strong,nonatomic)UILabel* overplusLabel;

///租金view
@property (strong,nonatomic)UILabel* rentLabel;

///是否是平台
@property (assign,nonatomic)BOOL isPersonal;

@end

@implementation HomePageTableViewCell

//-(NSDictionary *)contentDic{
//    if (!_contentDic) {
//        _contentDic = [NSDictionary dictionary];
//    }
//    return _contentDic;
//}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HomePageTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //测试用
//        _isPersonal = YES;
        
        [self createSubUI];
//        cell.contentDic = self.
//        UIView *selectedBackView = [[UIView alloc] init];
//        selectedBackView.backgroundColor = UIColorFromRGBA(0xf2f7f6, 1);
//        self.selectedBackgroundView = selectedBackView;
        
//        //假数据
//        [self addData];
        
    }
    return self;
}

-(void)setContentDic:(HomePageCellModel *)contentDic{
    _contentDic = contentDic;
    _titleLabel.text = contentDic.name;
    _exhibitorLabel.text = contentDic.platform;
    _detailsLabel.text = contentDic.remark;
    _overplusLabel.text = contentDic.leftNum;
    _rentLabel.text =[NSString stringWithFormat:@"租金\n￥%@",contentDic.dayprice];
    [_headerImage sd_setImageWithURL:[NSURL URLWithString:contentDic.coverImg] placeholderImage:[UIImage imageNamed:@"qq"]];

}


#pragma make 假数据
//-(void)addData{
//    _titleLabel.text = @"HTC alive";
//    _exhibitorLabel.text = @"平台提供";
//    _detailsLabel.text = @"UITabBarController的每个item不设title的话，那个title还是会占据着最下面那一行的位置，该怎么去隐藏它让那个位置空出来";
//    _overplusLabel.text = @"18";
//
//}

-(void)createSubUI{
    
    //展示图片
    _headerImage = [[UIImageView alloc]init];
    //标题Label
    _titleLabel = [CGTool createLabelWithFrame:CGRectZero fontColor:[UIColor blackColor] fontSize:17 textAligment:NSTextAlignmentLeft];
    
    //个人头像
    if (self.isPersonal) {
        _personalImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"qq"]];
        [self addSubview:_personalImage];
    }else{
        //剩余个数
        _overplusLabel = [CGTool createLabelWithFrame:CGRectZero fontColor:[UIColor blackColor] fontSize:14 textAligment:NSTextAlignmentRight];
        [self addSubview:_overplusLabel];
    }
    
    //平台Label/个人
    _exhibitorLabel =[CGTool createLabelWithFrame:CGRectZero fontColor:[UIColor color999999] fontSize:13 textAligment:NSTextAlignmentLeft];
    
    
    //详情Label
    _detailsLabel =[CGTool createLabelWithFrame:CGRectZero fontColor:[UIColor color999999] fontSize:13 textAligment:NSTextAlignmentLeft];
    _detailsLabel.numberOfLines = 0 ;
    
    //租金label
    _rentLabel = [CGTool createLabelWithFrame:CGRectMake(0, 0, 110, 40)fontColor:[UIColor whiteColor] fontSize:13 textAligment:NSTextAlignmentCenter];
    _rentLabel.numberOfLines = 2;
    _rentLabel.backgroundColor = UIColorFromRGBA(0,171,255,1);
    
    //添加到cell
    [self addSubview:_headerImage];
    [self addSubview:_titleLabel];
    [self addSubview:_exhibitorLabel];
    [self addSubview:_detailsLabel];
    [self addSubview:_rentLabel];
    
}

///添加限制约束
- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    
    [_headerImage makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.left).offset(12);
        make.top.equalTo(ws.top).offset(15);
        make.size.mas_equalTo(CGSizeMake(AdjustW(120), AdjustW(120)));
    }];
    
    [_rentLabel makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.right).offset(-AdjustW(10));
        make.top.equalTo(ws.top).offset(64);
        make.size.mas_equalTo(CGSizeMake(AdjustW(68), AdjustW(44)));
    }];
    
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headerImage.right).offset(AdjustW(10));
        make.top.equalTo(ws.top).offset(15);
        make.height.equalTo(@14);
        make.right.equalTo(_rentLabel.left).offset(-AdjustW(15));
    }];
    
    if (self.isPersonal) {
        [_personalImage makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headerImage.right).offset(AdjustW(10));
            make.top.equalTo(_titleLabel.bottom).offset(7);
            make.size.mas_equalTo(CGSizeMake(24, 24));
        }];
        [_exhibitorLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_personalImage.right).offset(6);
            make.centerY.equalTo(_personalImage.centerY);
            make.size.mas_equalTo(CGSizeMake(AdjustW(100), AdjustW(10)));
        }];
    }else{
        [_exhibitorLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headerImage.right).offset(AdjustW(10));
            make.top.equalTo(_titleLabel.bottom).offset(13);
            make.size.mas_equalTo(CGSizeMake(150, 20));
        }];
        
        [_overplusLabel makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(ws.right).offset(-10);
            make.top.equalTo(ws.top).offset(15);
            make.size.mas_equalTo(CGSizeMake(30, 14));
        }];
    }
    
    [_detailsLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headerImage.right).offset(AdjustW(10));
        make.top.equalTo(ws.top).offset(65);
        make.bottom.equalTo(ws.bottom).offset(-13);
        make.right.equalTo(_rentLabel.left).offset(-AdjustW(15));
        
    }];
}



@end
