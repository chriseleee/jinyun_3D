//
//  TRInteger.h
//  05_copy
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRInteger : NSObject<NSCopying>
@property int integer;
-(id)initWithInteger:(int)integer;
-(void)show;
@end
