//
//  main.m
//  07_NSDate
//
//  Created by tarena on 15/7/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *date = [[NSDate alloc] init];//date中存放的是国际标准时间
        NSLog(@"%@", date);
        NSDate *date1 = [NSDate date];//工厂方法
        NSLog(@"%@", date1);
        //获取当前本地时间
        NSTimeZone *zone = [NSTimeZone systemTimeZone];//计算机上的时间
        NSInteger interval = [zone secondsFromGMTForDate:date];//计算机上的时间与国际标准时间的秒数差
        NSDate *locateDate = [date dateByAddingTimeInterval:interval];
        NSLog(@"%@", locateDate);
        
        //获取一个时间，和当前时间比快30秒
        NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:30];
        NSLog(@"%@", date2);
        
        //1970至当前时间过了多少秒
        NSTimeInterval seconds = [date timeIntervalSince1970];
        NSLog(@"%g", seconds);
        //指定时间到现在过了多少秒
        seconds = [date2 timeIntervalSinceNow];
        NSLog(@"%g", seconds);
        
        //两个指定日期之间的时间差(秒)
        NSDate *date3 = [NSDate dateWithTimeIntervalSinceNow:-60 * 60 * 24];
        NSDate *date4 = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24];
        seconds = [date3 timeIntervalSinceDate:date4];
        NSLog(@"%g", seconds);
        
        //对比两个日期的早、晚、相同
        NSDate *date5 = [date3 earlierDate:date4];//早
        NSLog(@"%@", date5);
        NSDate *date6 = [date4 laterDate:date3];//晚
        NSLog(@"%@", date6);
        if([date3 isEqualToDate:date4])//相同
            NSLog(@"两个时间相同");
        else
            NSLog(@"两个时间不同");
        
        
        //按照自定义格式输出时间
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateFormat = @"yyyy年MM月dd日 hh时mm分ss秒";
        NSDate *date7 = [NSDate date];
        NSString *strDate = [dateFormatter stringFromDate:date7];
        NSLog(@"%@", strDate);
    }
    return 0;
}
