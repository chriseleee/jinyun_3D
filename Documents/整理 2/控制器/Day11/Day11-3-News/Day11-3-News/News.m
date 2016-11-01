//
//  News.m
//  Day11-3-News
//
//  Created by tarena on 15/8/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "News.h"

@implementation News
- (instancetype)initWithName:(NSString *)title name:(NSString *)imageName commentNum:(NSString *)commentNum{
    if (self = [super init]) {
        _imageName = imageName;
        _commentNum = commentNum;
        _title = title;
    }
    return self;
}

+ (NSArray *)demoData{
    News *n1 = [[News alloc] initWithName:@"联通被曝高危漏洞 或导致用户通话记录等信息泄露" name:@"n1" commentNum:@"121"];
    News *n2 = [[News alloc] initWithName:@"CES2015回顾:民用无人机来袭 中国公司占主导" name:@"n2" commentNum:@"144"];
    News *n3 = [[News alloc] initWithName:@"中企征战CES：难寻颠覆性产品 未打通海外品牌渠道" name:@"n3" commentNum:@"212"];
    News *n4 = [[News alloc] initWithName:@"老话重提：专车是否是黑车？被查合不合法？" name:@"n4" commentNum:@"588"];
    News *n5 = [[News alloc] initWithName:@"马云告诫员工千万别碰京东：京东将会成悲剧" name:@"n5" commentNum:@"1489"];
    News *n6 = [[News alloc] initWithName:@"三星Q4营业利润47亿美元超预期：内存芯片需求利好" name:@"n6" commentNum:@"6"];
    News *n7 = [[News alloc] initWithName:@"索尼宣布PS4国行版延期上市或因被举报不锁区" name:@"n7" commentNum:@"3843"];
    News *n8 = [[News alloc] initWithName:@"飞雪连天射白鹿，笑书神侠倚碧鸳" name:@"n8" commentNum:@"1221"];
    return @[n1, n2, n3, n4, n5, n6, n7, n8];
}



@end
