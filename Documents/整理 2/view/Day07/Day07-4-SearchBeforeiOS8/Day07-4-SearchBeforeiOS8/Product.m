//
//  Product.m
//  Day07-4-SearchBeforeiOS8
//
//  Created by tarena on 15/8/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Product.h"

@implementation Product
+ (NSArray *)demoData{
    Product *p1 = [[Product alloc] init];
    p1.name = @"iPhone5";
    p1.type = ProductTypeDevice;
    
    Product *p2 = [Product new];
    p2.name = @"iPhone6Plus";
    p2.type = ProductTypeDevice;
    
    Product *p3 = [Product new];
    p3.name = @"OS X Yosemite";
    p3.type = ProductTypeSoftware;
    
    Product *p4 = [Product new];
    p4.name = @"OS X EI Captain";
    p4.type = ProductTypeSoftware;
    
    Product *p5 = [Product new];
    p5.name = @"AirPort Time Capsule";
    p5.type = ProductTypeOther;
    
    return @[p1,p2,p3,p4,p5];
}
@end








