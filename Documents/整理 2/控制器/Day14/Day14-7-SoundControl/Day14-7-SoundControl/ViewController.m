//
//  ViewController.m
//  Day14-7-SoundControl
//
//  Created by tarena on 15/8/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//设置滚动过的图片
    [_slider setMaximumTrackImage:[UIImage imageNamed:@"playing_volumn_slide_foreground"] forState:UIControlStateNormal];
//设置未滚动到的图片
    [_slider setMinimumTrackImage:[UIImage imageNamed:@"playing_volumn_slide_bg"] forState:UIControlStateNormal];
//设置中间大圆球的背景图
    [_slider setThumbImage:[UIImage imageNamed:@"playing_volumn_slide_sound_icon"] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
