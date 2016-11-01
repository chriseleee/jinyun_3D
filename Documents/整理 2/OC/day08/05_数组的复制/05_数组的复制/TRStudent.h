//
//  TRStudent.h
//  05_数组的复制
//
//  Created by tarena on 15/7/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject<NSCopying>
@property int ID;
@property NSString *name;
-(id)initWithID:(int)ID andName:(NSString *)name;
@end
