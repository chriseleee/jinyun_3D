//
//  TRUSB.h
//  03_协议练习2
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TRUSB <NSObject>
-(void)read:(int) bytes;

@optional
-(void)write:(int) bytes;
@end                         
