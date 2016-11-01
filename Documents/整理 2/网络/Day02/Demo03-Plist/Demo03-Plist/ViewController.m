//
//  ViewController.m
//  Demo03-Plist
//
//  Created by tarena on 15/9/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
//手动创建plist文件
- (IBAction)createPlistGetData:(id)sender {
    //1.从Bundle Container中获取student.plist文件
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"student.plist" ofType:nil];
    //2.获取文件中的数据(根据plist的Root节点的type)
    NSArray *plistArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    //3.打印数据
    for (NSDictionary *itemDic in plistArray) {
        NSString *nameStr = [itemDic objectForKey:@"name"];
        NSNumber *ageNumber = [itemDic objectForKey:@"age"];
        
        NSLog(@"名字：%@; 年龄：%@", nameStr, ageNumber);
    }
}

- (IBAction)writeDicDataToPlist:(id)sender {
    /**直接写数据到student.plist? NO
     student.plist ---> Demo03-Plist.app(只有读的权限)
     */
    //将字典中的数据写入到plist文件(/Documents/user.plist)
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"user.plist"];
    NSDictionary *userDic = @{@"names": @[@"Shirley", @"Maggie", @"Jonny"]};
    [userDic writeToFile:plistPath atomically:YES];
}












@end
