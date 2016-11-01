//
//  TRRectangle.h
//  08_比较类信息
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPoint.h"

@interface TRRectangle : NSObject
@property (strong)TRPoint *origin;
@property int width, height;
@end
