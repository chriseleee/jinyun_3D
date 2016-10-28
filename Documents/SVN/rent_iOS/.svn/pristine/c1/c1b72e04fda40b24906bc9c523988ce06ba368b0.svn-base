//
//  CycleScrollView.m
//  xiakuajie
//
//  Created by zm on 14-11-7.
//  Copyright (c) 2014年 ingplus. All rights reserved.
//

#import "CycleScrollView.h"


@implementation CycleScrollView
{
    NSTimer *_timer;
}
-(id)initWithFrame:(CGRect)frame
{
    if ((self=[super initWithFrame:frame]))
    {
        self.userInteractionEnabled=YES;
        viewSize=frame;
        NSUInteger pageCount=[_imageArray count];
        _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, viewSize.size.width, viewSize.size.height)];
        _scrollView.pagingEnabled = YES;
        _scrollView.contentSize = CGSizeMake(viewSize.size.width * pageCount, viewSize.size.height);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];

    }
    return self;
}

-(void)setImageArray:(NSArray *)imageArray
{
    _imageArray = imageArray;
    
    [_pageControl removeFromSuperview];

    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, viewSize.size.height - 30, SCREEN_WIDTH, 30)];
    if ([self.type isEqualToString:@"brands"]) {
        
       _pageControl.frame = CGRectMake(0, viewSize.size.height - 30, SCREEN_WIDTH, 30);
    }
    
    [_pageControl setBackgroundColor:[UIColor clearColor]];
    _pageControl.numberOfPages = _imageArray.count;
    _pageControl.currentPage = 0;
    [_pageControl setPageIndicatorTintColor:[UIColor whiteColor]];
    [_pageControl setCurrentPageIndicatorTintColor:[UIColor color16B6D0]];
    
    _pageControl.userInteractionEnabled = NO;
    [self addSubview:_pageControl];
    
    if (_imageArray.count > 0) {
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * (_imageArray.count + 2), 0);
        _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
        
        for (NSInteger i = 0; i < _imageArray.count + 2; i++) {
            
            NSString *url;
            
            if (i == 0) {
                url = _imageArray[_imageArray.count - 1];
            }else if (i == _imageArray.count + 1){
                url = _imageArray[0];
            }else{
                url = _imageArray[i - 1];
            }
            UIImageView *imgView = [UIImageView new];
            [imgView setFrame:CGRectMake(viewSize.size.width*i, 0,viewSize.size.width, viewSize.size.height)];
            imgView.tag=i;
            
            if ([url rangeOfString:@"http:"].location == NSNotFound) {
                [imgView setImage:[UIImage imageNamed:url]];
            }else
            {
                UIImage *defaultImage;
                defaultImage = [UIImage imageNamed:@""];
                
                [imgView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:defaultImage];
//                NSLog(NSStringFromCGRect(imgView.frame));
                
            }
            
            UITapGestureRecognizer *Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imagePressed:)];
            [Tap setNumberOfTapsRequired:1];
            [Tap setNumberOfTouchesRequired:1];
            imgView.userInteractionEnabled=YES;
            [imgView addGestureRecognizer:Tap];
            //            [imgView setClipsToBounds:YES];
            //            [imgView setContentMode:UIViewContentModeScaleAspectFill];
            //
            [_scrollView addSubview:imgView];
        }
        
    }
    
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    if (_imageArray.count > 1) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target: self selector: @selector(changeImage) userInfo:nil repeats: YES];
    }
}
#pragma mark --UIScrollViewDelegate---

- (void)changeImage{
    
    NSInteger maxPage = _scrollView.contentSize.width / SCREEN_WIDTH;
    NSInteger page = (_scrollView.contentOffset.x / SCREEN_WIDTH) + 1;
    
    [UIView animateWithDuration:0.3 animations:^{
        _scrollView.contentOffset = CGPointMake(page * SCREEN_WIDTH, 0);
    } completion:^(BOOL finished) {
        if (page == 0) {
            _scrollView.contentOffset = CGPointMake((maxPage - 2) * SCREEN_WIDTH, 0);
            [_pageControl setCurrentPage:maxPage - 2];
        }else if (page == maxPage - 1){
            _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
            [_pageControl setCurrentPage:0];
        }else{
            [_pageControl setCurrentPage:page - 1];
        }
    }];
}

- (void)imagePressed:(UITapGestureRecognizer *)sender
{
    
    if ([_delegate respondsToSelector:@selector(cycleScrollViewDidClicked:)]) {
        [_delegate cycleScrollViewDidClicked:sender.view.tag];
    }
}

#pragma mrak scrollview代理

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger maxPage = scrollView.contentSize.width / SCREEN_WIDTH;
    NSInteger page = scrollView.contentOffset.x / SCREEN_WIDTH;
    
    if (page == 0) {
        scrollView.contentOffset = CGPointMake((maxPage - 2) * SCREEN_WIDTH, 0);
        [_pageControl setCurrentPage:maxPage - 2];
    }else if (page == maxPage - 1){
        scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
        [_pageControl setCurrentPage:0];
    }else{
        [_pageControl setCurrentPage:page - 1];
    }
}

@end
