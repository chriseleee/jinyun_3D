//
//  RenterBarViewController.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/27.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "RenterBarViewController.h"
#import "MarketTitleHeaderView.h"
#import "BaseRentBarTableVC.h"
#import "CGComposeViewController.h"

@interface RenterBarViewController ()<MarketTitleHeaderViewDelegate>

/**
 *  顶部View
 */
@property (nonatomic,strong) MarketTitleHeaderView *headerTitleView;

/**
 *  容器View
 */
@property (nonatomic,strong) UIView *contentView;

@end

@implementation RenterBarViewController

#pragma mark 懒加载与初始化相关

/**
 *  顶部View
 */
-(MarketTitleHeaderView *)headerTitleView
{
    if (_headerTitleView == nil) {
        NSArray *nameArr = @[@"咨询",@"VR硬件",@"VR内容",@"VR资源导航"];
        _headerTitleView = [[MarketTitleHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, AdjustHeight(35)) titleName:nameArr];
        _headerTitleView.delegate = self;
    }
    return _headerTitleView;
}

/**
 *  内容View
 */
-(UIView *)contentView
{
    if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
        _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _contentView;
}

-(NSMutableArray *)childViewControllerArr{
    if (!_childViewControllerArr) {
        _childViewControllerArr = [NSMutableArray array];
    }
    return _childViewControllerArr;
}

/**
 *  初始化
 */
-(instancetype)init
{
    if (self = [super init]) {
       
        for (int i = 0; i<4; i++) {
       
        BaseRentBarTableVC *vc = [[BaseRentBarTableVC alloc] init];
        [self addChildViewController:vc];
        [self.childViewControllerArr addObject:vc];
        }
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self creatUI];
    
    
}


//重新定位显示view的布局 防止tableView的显示不完全
-(void)viewWillLayoutSubviews{
    
    self.currentSelectedVC.view.frame = self.contentView.bounds;
}


-(void)creatUI{
    //顶部View
    [self.view addSubview:self.headerTitleView];
    self.headerTitleView.mj_y = 60;
    
    //内容View
    [self.view addSubview:self.contentView];
        
    self.contentView.frame = CGRectMake(0, self.headerTitleView.frame.size.height, SCREEN_WIDTH, SCREEN_Height - self.headerTitleView.frame.size.height);
    self.contentView.mj_y = self.headerTitleView.mj_h+self.headerTitleView.mj_y;
    self.currentSelectedVC = _childViewControllerArr[_headerTitleView.selectedIndex];
    
    [self.contentView addSubview:_currentSelectedVC.view];

    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSwipGestureOfLeftAndRight];
    
    //rightBarButtonItem
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(clickToReport) image:@"btn_edit" highImage:nil];

    
}


#pragma mark 点击事件
//rightBarButtonItem点击事件
-(void)clickToReport{
    CGComposeViewController *vc = [[CGComposeViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark 添加左右滑动手势
-(void)addSwipGestureOfLeftAndRight
{
    UISwipeGestureRecognizer *rightGest = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeToNextChildViewController:)];
    rightGest.direction = UISwipeGestureRecognizerDirectionRight;
    
    UISwipeGestureRecognizer *leftGest = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeToNextChildViewController:)];
    leftGest.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [_contentView addGestureRecognizer:rightGest];
    [_contentView addGestureRecognizer:leftGest];
}

/**
 *  往右滑--判断当前索引是否大于0，大于0--往后切换一个控制器，等于0则切换到最后一个控制器
 *  往左滑同右滑相反
 *  按钮tag从1000开始，根据数组个数依次从+0到+(count-1)
 *  @param direction 滑动方向
 */
-(void)swipeToNextChildViewController:(UISwipeGestureRecognizer *)direction
{
    _selectedIndex = _headerTitleView.selectedIndex;
    MarketTitleButton *beClickBtn;
    if(direction.direction==UISwipeGestureRecognizerDirectionRight)
    {
        if(self.selectedIndex > 0)
        {
            beClickBtn = (MarketTitleButton *)[_headerTitleView viewWithTag:(999 + _selectedIndex)];
            beClickBtn.marketTitleBtnBeClick(_selectedIndex - 1);
            
        }
        else
        {
            beClickBtn = (MarketTitleButton *)[_headerTitleView viewWithTag:(999 + _headerTitleView.titleBtnArr.count)];
            beClickBtn.marketTitleBtnBeClick(_headerTitleView.titleBtnArr.count - 1);
        }
    }
    else if(direction.direction==UISwipeGestureRecognizerDirectionLeft)
    {
        if(self.selectedIndex < (_headerTitleView.titleBtnArr.count - 1))
        {
            beClickBtn = (MarketTitleButton *)[_headerTitleView viewWithTag:(1001 + _selectedIndex)];
            beClickBtn.marketTitleBtnBeClick(_selectedIndex + 1);
            
        }
        else
        {
            beClickBtn = (MarketTitleButton *)[_headerTitleView viewWithTag:(1000)];
            beClickBtn.marketTitleBtnBeClick(0);
        }
    }
}

#pragma mark 顶部View  MarketTitleHeaderView代理方法  切换控制器
-(void)changeVCformIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex
{
    self.selectedIndex = toIndex;
    _headerTitleView.userInteractionEnabled = NO;
    if (![self isViewLoaded]) {
        
        fromIndex = toIndex;
    }
    else if(fromIndex != toIndex)
    {
        BaseRentBarTableVC *fromController;
        
        BaseRentBarTableVC *toController;
        
        if(fromIndex!=NSNotFound)
        {
            fromController=_currentSelectedVC;
        }
        NSInteger oldIndex = fromIndex;
        
        fromIndex = toIndex;
        
        if(fromIndex!=NSNotFound)
        {
            toController = _childViewControllerArr[toIndex];
        }
        
        if(toController==nil)
        {
            [toController.view removeFromSuperview];
        }
        else if(fromController==nil)
        {
            toController.view.frame=_contentView.bounds;
            
            [_contentView addSubview:toController.view];
        }
        
        CGRect rect=_contentView.bounds;
        
        if (oldIndex<fromIndex)
        {
            rect.origin.x=rect.size.width;
        }
        else
        {
            rect.origin.x=-rect.size.width;
        }
//        NSDictionary *dic = @{@"currentPage":[NSString stringWithFormat:@"%ld",toIndex+1]};
//        [HWNotificationCenter postNotificationName:CGRentBarPostCurrentPageNotification object:nil userInfo:dic];
        toController.category =[NSString stringWithFormat:@"%ld",(toIndex+1)];
        toController.view.frame = rect;
        
        [self addChildViewController:toController];
        
        [self transitionFromViewController:fromController toViewController:toController duration:0.3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGRect rect=toController.view.frame;
            if(oldIndex<fromIndex)
            {
                rect.origin.x=-rect.size.width;
            }
            else
            {
                rect.origin.x=rect.size.width;
            }
            fromController.view.frame=rect;
            toController.view.frame=_contentView.bounds;
        }
                                completion:^(BOOL finished) {
                                    _headerTitleView.userInteractionEnabled = YES;//防止来回快速切换，清空了view
                                    if (finished) {
                                        
                                        [toController didMoveToParentViewController:self];
                                        [fromController willMoveToParentViewController:nil];
                                        [fromController removeFromParentViewController];
                                    }
                                    self.currentSelectedVC = toController;
                                    
                                }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
