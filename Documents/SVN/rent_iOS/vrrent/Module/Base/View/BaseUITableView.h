//
//  BaseUITableView.h
//  TradeBook
//
//  Created by clark on 16/2/17.
//  Copyright © 2016年 ethan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"

typedef enum tagErrorType
{
    internetErrorType = 1000,//网络异常
    loadErrorType,//加载异常
    noDataType,//无数据
    buildinginType,//正在加载中
}errorType;

@interface BaseUITableView : UITableView<DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>

//无数据时 对应界面的描述文字
@property (nonatomic,copy)NSString *descriptionText;

//加载异常 对应界面的描述文字
@property (nonatomic,copy)NSString *loadUnusualText;

//错误信息显示设置
@property (nonatomic,assign)BOOL isDisplay;

//错误类型
@property (nonatomic,assign)errorType errorTipType;

//设置显示与错误类型
-(void)errorType:(errorType)type isDisplay:(BOOL)display;

@end
