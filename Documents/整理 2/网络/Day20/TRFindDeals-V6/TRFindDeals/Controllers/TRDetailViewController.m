//
//  TRDetailViewController.m
//  TRFindDeals
//
//  Created by tarena on 15/9/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDetailViewController.h"

@interface TRDetailViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation TRDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.deal.deal_h5_url]]];

}
- (IBAction)clickBackButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}





@end
