//
//  AddViewController.h
//  Day10-1-Homework
//
//  Created by tarena on 15/8/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddViewControllerDelegate <NSObject>
- (void)addContactWithName:(NSString *)name phone:(NSString *)phone address:(NSString *)address;
@end
@interface AddViewController : UIViewController
@property(nonatomic) id<AddViewControllerDelegate> delegate;
@end






