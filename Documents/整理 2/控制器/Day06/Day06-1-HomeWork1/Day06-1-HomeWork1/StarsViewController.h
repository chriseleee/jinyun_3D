//
//  StarsViewController.h
//  Day06-1-HomeWork1
//
//  Created by tarena on 15/8/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
//1
@protocol StarsViewControllerDelegate <NSObject>
- (void)chooseStarDetail:(NSString *)detail;
@end

@interface StarsViewController : UIViewController
//2
@property(nonatomic) id<StarsViewControllerDelegate> delegate;
@end






