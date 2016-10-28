//
//  BaseUITableView.m
//  TradeBook
//
//  Created by clark on 16/2/17.
//  Copyright © 2016年 ethan. All rights reserved.
//

#import "BaseUITableView.h"
//#import "InformationCollectViewController.h"

@implementation BaseUITableView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.emptyDataSetDelegate = self;
        self.emptyDataSetSource = self;
        self.backgroundColor = UIRandomColor;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        self.emptyDataSetDelegate = self;
        self.emptyDataSetSource = self;
        self.backgroundColor = UIRandomColor;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

//设置显示与错误类型
-(void)errorType:(errorType)type isDisplay:(BOOL)display
{
    self.errorTipType = type;
    self.isDisplay = display;
    
}

#pragma mark 代理方法
//无数据时，底部描述文字
-(NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"";
    UIFont *font = [UIFont systemFontOfSize:14.0];
    UIColor *textColor = UIRandomColor;
    if (_errorTipType == buildinginType) {
        text = @"稍安勿躁，正在加载中";
    }else if(_errorTipType == noDataType)
    {
        text = (self.descriptionText.length)?self.descriptionText:@"目前暂无相关数据";
    }
    else if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusUnknown ||[AFNetworkReachabilityManager sharedManager].networkReachabilityStatus ==AFNetworkReachabilityStatusNotReachable || _errorTipType == loadErrorType)
    {
        text = (_loadUnusualText.length)?_loadUnusualText:@"请确认网络是否已连接，下拉刷新可重新加载";
    }
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;

    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    if (paragraph) [attributes setObject:paragraph forKey:NSParagraphStyleAttributeName];

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    return attributedString;
}

//无数据时的背景图片设置
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    
    if (_errorTipType == buildinginType)//加载中
    {
       return [UIImage imageNamed:@"buildinginview"];
    }else if(_errorTipType == noDataType)//无数据
    {
        return [UIImage imageNamed:@"nothinginview"];
    }
    //无网络
    else if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusUnknown ||[AFNetworkReachabilityManager sharedManager].networkReachabilityStatus ==AFNetworkReachabilityStatusNotReachable  || _errorTipType == loadErrorType)
    {
        return [UIImage imageNamed:@"errroinview"];
    }

    return nil;
}

//无数据时允许拖拽
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

//偏移距离
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    CGFloat height = 0.0;
    //隐藏tabbar
    if (scrollView.center.y >= (SCREEN_Height - 64)*0.5) {
        //距离顶部15
        if (scrollView.frame.origin.y > 0) {
            height = 49;
        }
        height =  0;//49 + 15
    }
    
    // iPhone5
    if (SCREEN_WIDTH < 375) {
       return (scrollView.center.y-AdjustHeight(250)-height);
    }
    // iPhone6
    else if(SCREEN_WIDTH == 375)
    {
        return (scrollView.center.y-AdjustHeight(320)-height);
    }
    // iPhone plus
    else
        return (scrollView.center.y-AdjustHeight(380)-height);
}

//文字与图片的距离
- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    return 27.0;
}

//显示与隐藏
-(BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return _isDisplay;
}

@end
