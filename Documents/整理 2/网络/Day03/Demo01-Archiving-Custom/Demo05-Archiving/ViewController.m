//
//  ViewController.m
//  Demo05-Archiving
//
//  Created by tarena on 15/9/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
@property (nonatomic, strong) NSString *archivingFilePath;

@end

@implementation ViewController

- (NSString *)archivingFilePath {
    if (!_archivingFilePath) {
        NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        _archivingFilePath = [documentsPath stringByAppendingPathComponent:@"archivingFile"];
    }
    return _archivingFilePath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)archiveArrayData:(id)sender {
    
//    a. 准备可变数据对象NSMutableData
    NSMutableData *mutableData = [NSMutableData data];
    NSLog(@"初始可变data长度:%lu", (unsigned long)mutableData.length);//0
//    b. 创建归档对象NSKeyedArchiver
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mutableData];
//    c. 针对要保存的对象进行编码encode
//    NSArray *dataArray = @[@"Jonny", @18, @[@"Ruby", @"Java"]];
    //自定义类型的数据
    Person *person = [[Person alloc] initWithName:@"Jonny" withAge:21];
    Person *secondPerson = [[Person alloc] initWithName:@"Maggie" withAge:20];
    
    [archiver encodeObject:person forKey:@"firstPerson"];
    [archiver encodeObject:secondPerson forKey:@"secondPerson"];
    
    
    //执行归档动作!!!!
    [archiver finishEncoding];
    NSLog(@"归档之后数据长度：%lu", (unsigned long)mutableData.length);
    
//    d. 将数据写到文件中
    [mutableData writeToFile:self.archivingFilePath atomically:YES];
    
}

- (IBAction)unarchiveArrayData:(id)sender {
    
//    a. 创建反归档对象NSKeyedUnarchiver
    NSData *data = [NSData dataWithContentsOfFile:self.archivingFilePath];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
//    b. 针对要读取的对象进行解码
//    NSArray *array = [unarchiver decodeObjectForKey:@"user"];
    Person *firstPerson = [unarchiver decodeObjectForKey:@"firstPerson"];
    Person *secondPerson = [unarchiver decodeObjectForKey:@"secondPerson"];
    
//    c. 执行反归档的动作
    [unarchiver finishDecoding];
    
    //打印验证
    NSLog(@"反归档后的数据:%@", firstPerson);
    NSLog(@"反归档后的数据:%@", secondPerson);
}








@end
