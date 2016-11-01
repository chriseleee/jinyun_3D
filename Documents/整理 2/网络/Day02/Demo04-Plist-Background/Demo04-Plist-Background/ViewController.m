//
//  ViewController.m
//  Demo04-Plist-Background
//
//  Created by tarena on 15/9/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (nonatomic, strong) NSString *plistPath;

@end

@implementation ViewController
//懒加载
- (NSString *)plistPath {
    if (!_plistPath) {
        NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        self.plistPath = [documentPath stringByAppendingPathComponent:@"test.plist"];
    }
    
    return _plistPath;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //从plist文件中读取数据，显示在界面上
    [self initDataByPlist];
    
    //添加观察者
    /**
     object: 指定接收哪个对象传来的通知
     nil: 接收任意一个对象发送过来的通知
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:[UIApplication sharedApplication]];
    
}

- (void)initDataByPlist {
    //将程序启动第一次情况排除(是否存在plist文件)
    if ([[NSFileManager defaultManager] fileExistsAtPath:self.plistPath]) {
        //恢复数据
        NSDictionary *dataDic = [NSDictionary dictionaryWithContentsOfFile:self.plistPath];
        //恢复名字
        self.nameTextField.text = [dataDic objectForKey:@"name"];
        
        //恢复年龄
        self.ageTextField.text = [dataDic objectForKey:@"age"];
    }
    
}

- (void)appEnterBackground {
    //保存用户输入的数据(plist)
    NSString *nameStr = self.nameTextField.text;
    NSString *ageStr = self.ageTextField.text;
    
    //NSArray; NSDictionary
    NSDictionary *dic = @{@"name":nameStr,@"age":ageStr};
    [dic writeToFile:self.plistPath atomically:YES];
}








@end
