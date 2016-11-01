//
//  TRDealsCollectionViewController.h
//  TRFindDeals
//
//  Created by Xiao on 15/10/7.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRDealsCollectionViewController : UICollectionViewController

//给子类的加载团购接口
- (void)loadNewDeals;

//给子类提供的设置发送请求的参数接口
- (void)settingParams:(NSMutableDictionary *)params;

@end
