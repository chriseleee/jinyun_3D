//
//  GreenViewController.h
//  Day14-4-PassValueBack
//
//  Created by tarena on 15/8/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GreenViewControllerDelegate <NSObject>
- (void)returnMessage:(NSString *)msg;
@end

@interface GreenViewController : UIViewController
@property (nonatomic) id<GreenViewControllerDelegate> delegate;
@end






