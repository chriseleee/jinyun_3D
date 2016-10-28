//
//  CycleScrollView.h
//  xiakuajie
//
//  Created by zm on 14-11-7.
//  Copyright (c) 2014年 ingplus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CycleScrollViewDelegate <NSObject>

@optional

-(void)cycleScrollViewDidClicked:(NSUInteger)index;

@end
@interface CycleScrollView : UIView<UIScrollViewDelegate> {
    CGRect viewSize;
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    int currentPageIndex;
}
@property(nonatomic,retain)id<CycleScrollViewDelegate> delegate;

@property (nonatomic,strong) NSArray *imageArray;
@property (nonatomic,strong) NSString *type;
@end
