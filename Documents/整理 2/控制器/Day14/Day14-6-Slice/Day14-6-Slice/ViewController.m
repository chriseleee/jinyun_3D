//
//  ViewController.m
//  Day14-6-Slice
//
//  Created by tarena on 15/8/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image = [UIImage imageNamed:@"message_i"];
//对图片进行切分
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(16, 16, 16, 30) resizingMode:UIImageResizingModeStretch];
    _imageView.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
