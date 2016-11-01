//
//  TRTableViewCell.h
//  TRFindDeals
//
//  Created by tarena on 15/9/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRRegion.h"
#import "TRCategory.h"

@interface TRTableViewCell : UITableViewCell

//对外提供一个区域的属性
@property (nonatomic, strong) TRRegion *region;

//对外提供一个分类的属性
@property (nonatomic, strong) TRCategory *category;


//返回一个已经创建好的cell
+ (id)cellWithTableView:(UITableView *)tableView withImageName:(NSString *)imageName withSelectedImageName:(NSString *)selectedImageName;











@end
