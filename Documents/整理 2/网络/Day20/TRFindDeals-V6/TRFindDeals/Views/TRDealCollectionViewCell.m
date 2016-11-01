//
//  TRDealCollectionViewCell.m
//  TRFindDeals
//
//  Created by tarena on 15/9/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDealCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface TRDealCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *listPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *purchaseCountLabel;

@end

@implementation TRDealCollectionViewCell

//重写setDeal方法
- (void)setDeal:(TRDeal *)deal {
    //设置collection cell的背景图
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dealcell"]];
    
    //团购订单图 (下载图片：SDWebImage)
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:deal.image_url] placeholderImage:[UIImage imageNamed:@"placeholder_deal"]];
    
    //title
    self.titleLabel.text = deal.title;
    
    //描述文本
    self.descriptionLabel.text = deal.desc;
    
    //现价
    self.currentPriceLabel.text = [NSString stringWithFormat:@"¥%@", deal.current_price];
    
    //原价
    self.listPriceLabel.text = [NSString stringWithFormat:@"¥%@", deal.list_price];
    
    //售出多少
    self.purchaseCountLabel.text = [NSString stringWithFormat:@"已售出%@",deal.purchase_count];
}








@end
