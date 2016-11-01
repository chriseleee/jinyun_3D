//
//  ViewController.m
//  Day06-0-CartHomework
//
//  Created by tarena on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) UIImageView *goodsIV;
@property(nonatomic,strong) UIView *cartV;
@end
@implementation ViewController
- (UIView *)cartV{
    if (!_cartV) {
        _cartV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        _cartV.center = CGPointMake(self.view.center.x, self.view.frame.size.height - 60);
        _cartV.backgroundColor = [UIColor redColor];
    }
    return _cartV;
}
- (UIImageView *)goodsIV{
    if (!_goodsIV) {
        _goodsIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"snow"]];
        _goodsIV.frame = CGRectMake(20, 20, 80, 80);
        _goodsIV.contentMode = UIViewContentModeScaleAspectFit;
//用代码初始化的图片控件，UserInteraction默认为NO，即不接受用户操作
        _goodsIV.userInteractionEnabled = YES;
    }
    return _goodsIV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.goodsIV];
    [self.view addSubview:self.cartV];
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.goodsIV addGestureRecognizer:tapGR];
}
- (void)tap:(UITapGestureRecognizer *)gr{
//    1.移动雪花到红色区域
//    2.原来的雪花不动，应该生成一个新的雪花来表现动画
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.goodsIV.frame];
    imageView.image = [UIImage imageNamed:@"snow"];
//addSubview 会给imageView的内存计数+1
    [self.view addSubview:imageView];

    [UIView animateWithDuration:2 animations:^{
        imageView.center = self.cartV.center;
        //    3.雪花由大 到小，调入到购物车
        imageView.transform = CGAffineTransformMakeScale(0.3, 0.3);
    }completion:^(BOOL finished) {
//completion块,当动画结束 会进入这个方法
        //4.雪花掉入购物车以后，消失掉
//        imageView.hidden = YES;
//        5.让雪花融化掉
        [UIView animateWithDuration:1 animations:^{
            imageView.alpha = 0;
        }completion:^(BOOL finished) {
//防止内存持续增高，把消失掉的雪花，从父view中移除掉
            [imageView removeFromSuperview];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
