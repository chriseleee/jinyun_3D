//
//  TRStudent.h
//  03_Block
//
//  Created by tarena on 15/7/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject
@property int ID;
@property NSString *name;
-(id)initWithID:(int)ID andName:(NSString*)name;
@end
