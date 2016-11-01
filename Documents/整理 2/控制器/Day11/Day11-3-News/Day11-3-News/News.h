//
//  News.h
//  Day11-3-News
//
//  Created by tarena on 15/8/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *commentNum; //评论数
- (instancetype)initWithName:(NSString *)title name:(NSString *)imageName commentNum:(NSString *)commentNum;

+ (NSArray *)demoData;
@end







