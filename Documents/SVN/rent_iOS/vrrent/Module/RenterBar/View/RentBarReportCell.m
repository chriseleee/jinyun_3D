//
//  RentBarReportCell.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/5.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "RentBarReportCell.h"
#import "HWStatusPhotosView.h"
#import "AddressView.h"
#import "commentButton.h"
#import "RentBarReportM.h"

//用来跳转的vc
#import "LoginViewController.h"
@interface RentBarReportCell ()

///头像
@property(nonatomic,weak) UIImageView *iconView;
///昵称
@property(nonatomic,strong) UILabel *nameLabel;
/** 时间 */
@property (nonatomic, strong) UILabel *timeLabel;
/** 正文 */
@property (nonatomic, strong) UILabel *contentLabel;
///地址信息
@property(nonatomic,strong) AddressView *addressView;
/** 配图 */
@property (nonatomic, strong) HWStatusPhotosView *photosView;
///评论btn
@property (nonatomic,strong) commentButton *commentBtn;
///点赞btn
@property(nonatomic,strong) commentButton *loveyBtn;
//定义一个contentLabel文本高度的属性
@property (nonatomic,assign) CGFloat contentPhotosH;

@end

@implementation RentBarReportCell

-(HWStatusPhotosView *)photosView{
    if (!_photosView) {
        _photosView = [[HWStatusPhotosView alloc] init];
    }
    return _photosView;
}


+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"report";
    RentBarReportCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[RentBarReportCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;

}

/**
 *  cell的初始化方法，一个cell只会调用一次
 *  一般在这里添加所有可能显示的子控件，以及子控件的一次性设置
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        // 点击cell的时候不要变色
        self.selectionStyle = UITableViewCellSelectionStyleNone;
                
        // 初始化report
        [self setupReport];

    }
    return self;
}
/// 初始化report
-(void)setupReport{
    ///头像
    UIImageView *iconView = [[UIImageView alloc]init];
    self.iconView = iconView;
    [self addSubview:_iconView];
    
    ///昵称
    _nameLabel = [CGTool createLabelWithFrame:CGRectZero fontColor:[UIColor blackColor] fontSize:17 textAligment:(NSTextAlignmentLeft)];
    [self addSubview:_nameLabel];//HexRGB(0x333333)
    
    ///时间
    _timeLabel = [CGTool createLabelWithFrame:CGRectZero fontColor:HexRGB(0x8B8E97) fontSize:13 textAligment:(NSTextAlignmentLeft)];
    [self addSubview:_timeLabel];
    
    ///评论
    self.commentBtn = [[commentButton alloc]initWithFrame:CGRectZero withImageName:@"btn_comment" selectedImage:@"btn_comment_white"];
    [self addSubview:_commentBtn];
    
    ///点赞
    self.loveyBtn = [[commentButton alloc]initWithFrame:CGRectZero withImageName:@"btn_like" selectedImage:@"btn_like_white"];
    [self.loveyBtn addTarget:self action:@selector(loveyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_loveyBtn];
    
    ///content
    self.contentLabel = [[UILabel alloc]init];
    self.contentLabel.font = [UIFont systemFontOfSize:13];
    self.contentLabel.numberOfLines = 0;
    [self addSubview:_contentLabel];
    
    ///地址
    self.addressView = [[AddressView alloc]init];
    [self addSubview:_addressView];
    self.addressView.hidden = YES;
    ///配图
    
    [self addSubview:self.photosView];
    
    ///约束
    WS(ws)
    [_iconView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.top).offset(AdjustW(12));
        make.left.equalTo(ws.left).offset(AdjustW(12));
        make.size.mas_equalTo(CGSizeMake(AdjustW(48), AdjustW(48)));
    }];
    
    [_loveyBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.top).offset(AdjustW(12));
        make.right.equalTo(ws.right).offset(-AdjustW(20));
        make.size.mas_equalTo(CGSizeMake(AdjustW(42), AdjustW(20)));
    }];
    [_commentBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.top).offset(AdjustW(12));
        make.right.equalTo(_loveyBtn.left).offset(-AdjustW(30));
        make.size.mas_equalTo(CGSizeMake(AdjustW(42), AdjustW(20)));
    }];
    
    [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.top).offset(AdjustW(12));
        make.left.equalTo(_iconView.right).offset(AdjustW(12));
        make.right.equalTo(_commentBtn.left).offset(-AdjustW(15));
        make.height.mas_equalTo(@18);
        
    }];
    [_timeLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLabel.bottom).offset(AdjustW(10));
        make.left.equalTo(_nameLabel.left);
        make.right.equalTo(_commentBtn.left).offset(-AdjustW(15));
        make.height.mas_equalTo(@14);
        
    }];
    
    [_contentLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconView.bottom).offset(AdjustW(15));
        make.left.equalTo(ws.left).offset(AdjustW(12));
        make.right.equalTo(ws.right).offset(-AdjustW(12));
        make.height.equalTo(@42);
    }];
    
    [_photosView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentLabel.bottom).offset(AdjustW(15));
        make.left.equalTo(ws.left).offset(10);
        make.right.equalTo(ws.right).offset(-10);
    }];
    
}

-(void)setReportM:(RentBarReportM *)reportM{
    _reportM = reportM;
    
    ///添加数据
    [_iconView sd_setImageWithURL:[NSURL URLWithString: _reportM.headIcon]];
    _nameLabel.text = reportM.nickName;
    _timeLabel.text = reportM.createTime;
    [_commentBtn setTitle:reportM.commentNum forState:UIControlStateNormal];
    [_loveyBtn setTitle:reportM.likeNum forState:UIControlStateNormal];
    _contentLabel.text = reportM.dynamicContent;
    //图片字符串处理
    
    NSString *imageURL = reportM.dynamicImgs;
    //字符串转数组
    NSLog(@"string:%@",imageURL);
    NSArray *imageArray = [imageURL componentsSeparatedByString:@","];
    NSLog(@"rentbar图片%ld",(long)imageArray.count);
    
    if (imageArray.count>0) {
        self.photosView.photos = imageArray;
        self.photosView.hidden = NO;
    }else{
        self.photosView.hidden = YES;
    }
    
}

//在表格cell中 计算出高度
-(CGFloat)rowHeightWithCellModel:(RentBarReportM *)reportM
{
    _reportM = reportM;

    WS(ws)
    [_photosView makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(ws.contentPhotosH);
    }];
    
    // 2. 更新约束
    [self layoutIfNeeded];
    
    //3.  视图的最大 Y 值
    CGFloat h= CGRectGetMaxY(self.photosView.frame);
    
    return h+10; //最大的高度+10
}

-(CGFloat)contentPhotosH{
    if (!_contentPhotosH) {
        
        //图片字符串处理
        
        NSString *imageURL = self.reportM.dynamicImgs;
        //字符串转数组
        NSLog(@"string:%@",imageURL);
        NSArray *imageArray = [imageURL componentsSeparatedByString:@","];
        NSLog(@"rentbar图片%ld",(long)imageArray.count);
        
        //配图设置
        CGSize photosSize = CGSizeZero;
        if (imageArray.count)//有配图
        {
            photosSize = [HWStatusPhotosView sizeWithCount:imageArray.count];
        }
        
        
        _contentPhotosH = photosSize.height +10;
    }
    return _contentPhotosH;
}

-(void)loveyBtnClick:(UIButton*)btn{
    
    if (btn.selected==NO) {
        [self judgeIsLogin];
    }
    
    btn.selected = !btn.selected;
}

/**
 *  判断是否登录，没有登录得登录
 */
-(void)judgeIsLogin{
    BOOL isLogin = [CGTool isLogin];
    if (!isLogin) {
        LoginViewController *login = [[LoginViewController alloc]init];
        
        [self.fatherVC presentViewController:login animated:YES completion:nil];
    }
}

@end
