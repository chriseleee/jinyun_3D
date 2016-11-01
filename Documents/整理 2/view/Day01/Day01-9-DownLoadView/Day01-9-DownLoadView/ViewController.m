//
//  ViewController.m
//  Day01-9-DownLoadView
//
//  Created by tarena on 15/8/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "DownloadView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DownloadView *downloadView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@end
@implementation ViewController

- (IBAction)changeDownloadValue:(id)sender {
    _downloadView.progressValue = _slider.value;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.slider.value = 0;
    _downloadView.progressColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
