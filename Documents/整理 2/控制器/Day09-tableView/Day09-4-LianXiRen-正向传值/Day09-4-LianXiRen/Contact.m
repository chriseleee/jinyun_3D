//
//  Contact.m
//  Day09-4-LianXiRen
//
//  Created by tarena on 15/8/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Contact.h"

@implementation Contact

+ (NSArray *)contactArr{
    Contact *c1 = [Contact new];
    c1.name = @"Lisa";
    c1.sex = @"女";
    c1.address = @"北京";
    
    Contact *c2 = [Contact new];
    c2.name = @"Mark";
    c2.sex = @"男";
    c2.address = @"香港";
    
    Contact *c3 = [Contact new];
    c3.name = @"Tom";
    c3.sex = @"男";
    c3.address = @"南京";
    
    Contact *c4 = [Contact new];
    c4.name = @"Jerry";
    c4.sex = @"女";
    c4.address = @"杭州";
    return @[c1, c2, c3, c4];
}









@end
