//
//  SecondViewController.h
//  Day05-3-PassValue
//
//  Created by tarena on 15/8/5.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
//为了接收其他对象传入的数据，公开一个属性
@property (nonatomic, strong) NSString *message;

@end
