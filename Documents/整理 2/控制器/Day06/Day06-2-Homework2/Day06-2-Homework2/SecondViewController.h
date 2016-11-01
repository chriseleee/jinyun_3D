//
//  SecondViewController.h
//  Day06-2-Homework2
//
//  Created by tarena on 15/8/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
//1
@protocol SecondViewControllerDelegate <NSObject>
- (void)makeTFWithRect:(CGRect)rect content:(NSString *)content;
@end

@interface SecondViewController : UIViewController
//2
@property (nonatomic) id<SecondViewControllerDelegate> delegate;
@end



