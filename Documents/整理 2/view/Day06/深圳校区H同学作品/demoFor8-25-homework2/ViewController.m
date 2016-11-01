//
//  ViewController.m
//  demoFor8-25-homework2
//
//  Created by HeWei on 15/8/25.
//  Copyright (c) 2015年 HeWei. All rights reserved.
//
/*
 2.做一个购物车的动画
 在屏幕的上方有一个imageView，是一个商品，点击此商品时，商品会从上面掉下来，落入下面的购物车中。 注意商品掉下来时，屏幕上方的商品图片不会消失.
 */

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (nonatomic,strong)UIImageView *dropImageView;
@property (nonatomic,strong)UIImageView *runningBoy;
@end

@implementation ViewController
-(UIImageView *)dropImageView{
    if (!_dropImageView) {
        _dropImageView=[[UIImageView alloc]init];
    }
    return _dropImageView;
}
-(UIImageView *)runningBoy{
    if (!_runningBoy) {
        _runningBoy=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        _runningBoy.center=CGPointMake(self.view.center.x, self.view.frame.size.height-40);
        _runningBoy.image=[UIImage animatedImageNamed:@"loading_" duration:0.5];
    }
    return _runningBoy;
}


- (IBAction)drop:(UIButton *)sender {
    self.dropImageView.image=sender.currentImage;
    self.dropImageView.frame=sender.frame;
    
    CGPoint goal=CGPointMake(sender.center.x, self.view.frame.size.height-40);
    
    [self.view addSubview:self.runningBoy];
    
    [self.view addSubview:self.dropImageView];
    
    self.dropImageView.transform=CGAffineTransformIdentity;
    
    if (self.runningBoy.center.x>goal.x) {
        self.runningBoy.transform=CGAffineTransformMakeScale(-1, 1);
    }
    else if (self.runningBoy.center.x<goal.x) {
        self.runningBoy.transform=CGAffineTransformMakeScale(1, 1);
    }
    
    [UIView animateKeyframesWithDuration:3 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        self.dropImageView.center=goal;
        self.runningBoy.center=goal;
        self.dropImageView.transform=CGAffineTransformMakeScale(0.2, 0.2);
    } completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.runningBoy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
