//
//  RentBarInformationTableCell.h
//  vrrent
//
//  Created by 龚俊平 on 16/4/29.
//  Copyright © 2016年 golden. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RentBarReportM;
@interface RentBarInformationTableCell : UITableViewCell



///初始化方法
+ (instancetype)cellWithTableView:(UITableView *)tableView;

///数据字典
@property (strong,nonatomic)RentBarReportM* contentDic;

@end
