//
//  TRStudent.h
//  02_NSSet
//
//  Created by tarena on 15/7/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject
@property NSString *name;
@property int age;
-(id)initWithName:(NSString*)name andAge:(int)age;
+(id)studentWithName:(NSString*)name andAge:(int)age;
@end
