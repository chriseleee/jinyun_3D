//
//  SecondViewController.h
//  Day05-4-PassValueBack
//
//  Created by tarena on 15/8/5.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface SecondViewController : UIViewController

//使用weak的原因？
//因为A推出B，A创建了B实例，所以A强引用了B。 现在B反过来又要引用A， 如果还是强引用，那么会形成循环引用，导致内存泄露。
//strong强引用  weak弱引用
@property (nonatomic, weak) ViewController *vc;

@end






