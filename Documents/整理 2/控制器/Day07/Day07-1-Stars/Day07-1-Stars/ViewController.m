//
//  ViewController.m
//  Day07-1-Stars
//
//  Created by tarena on 15/8/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
//4 引代理
@interface ViewController ()<SecondViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *starNameLb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SecondViewController *vc = segue.destinationViewController;
    //5
    vc.delegate = self;
}

//6
- (void)chooseStar:(NSString *)starName{
    _starNameLb.text = starName;
}

@end






