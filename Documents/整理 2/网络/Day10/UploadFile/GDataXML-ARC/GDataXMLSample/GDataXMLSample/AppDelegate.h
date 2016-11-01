//
//  AppDelegate.h
//  GDataXMLSample
//
//  Created by iC on 2/26/13.
//  Copyright (c) 2013 iC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDataXMLNode.h"

@class Party;

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (nonatomic, retain) Party *party;
@end
