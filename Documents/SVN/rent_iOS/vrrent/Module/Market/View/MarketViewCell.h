//
//  MarketViewCell.h
//  vrrent
//
//  Created by 龚俊平 on 16/4/28.
//  Copyright © 2016年 golden. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MarketCellModel;
@interface MarketViewCell : UICollectionViewCell

///数据字典
@property (strong,nonatomic)MarketCellModel* contentDic;

@end
