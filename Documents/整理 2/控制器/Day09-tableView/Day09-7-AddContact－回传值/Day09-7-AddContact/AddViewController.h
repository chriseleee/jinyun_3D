//
//  AddViewController.h
//  Day09-7-AddContact
//
//  Created by tarena on 15/8/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
//1
@protocol AddViewControllerDelegate <NSObject>
- (void)addContactName:(NSString *)name;
@end

@interface AddViewController : UIViewController
//2
@property(nonatomic) id<AddViewControllerDelegate> delegate;
@end




