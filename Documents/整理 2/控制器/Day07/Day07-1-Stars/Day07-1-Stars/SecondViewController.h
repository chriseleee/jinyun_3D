//
//  SecondViewController.h
//  Day07-1-Stars
//
//  Created by tarena on 15/8/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
//1
@protocol SecondViewControllerDelegate <NSObject>
- (void)chooseStar:(NSString *)starName;
@end

@interface SecondViewController : UIViewController
//2
@property (nonatomic) id<SecondViewControllerDelegate> delegate;
@end





