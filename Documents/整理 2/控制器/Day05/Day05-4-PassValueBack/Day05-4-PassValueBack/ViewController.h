//
//  ViewController.h
//  Day05-4-PassValueBack
//
//  Created by tarena on 15/8/5.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//公开一个属性，用于接收B回传回来的值。
@property (nonatomic, strong) NSString *message;

@end







