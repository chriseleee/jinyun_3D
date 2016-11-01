//
//  TRCollectionViewCell.m
//  TRTuanDeal
//
//  Created by Xiao on 15/10/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TRCollectionViewCell.h"
#import "UIImageView+WebCache.h"


@interface TRCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *listPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *purchaseCountLabel;


@end

@implementation TRCollectionViewCell

//重写deal属性的set方法
- (void)setDeal:(TRDeal *)deal {
    
    
    /////设置cell的背景图片 (相对好内存)
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dealcell"]];
    
    //加载图片
    //deal.image_url (SDWebImage)
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:deal.image_url] placeholderImage:[UIImage imageNamed:@"placeholder_deal"]];
    
    
    //文本
    self.titleLabel.text = deal.title;
    
    //描述
    self.descriptionLabel.text = deal.desc;
    
    //现价
    self.currentPriceLabel.text = [NSString stringWithFormat:@"￥ %@", deal.current_price];
    
    //原价
    self.listPriceLabel.text = [NSString stringWithFormat:@"￥ %@", deal.list_price];
    
    //已售出
    self.purchaseCountLabel.text = [NSString stringWithFormat:@"￥ %.0d", deal.purchase_count];
    
}

@end
