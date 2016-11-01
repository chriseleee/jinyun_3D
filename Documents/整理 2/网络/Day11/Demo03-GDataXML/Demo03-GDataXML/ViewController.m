//
//  ViewController.m
//  Demo03-GDataXML
//
//  Created by tarena on 15/9/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.获取xml文件的数据
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"Party" ofType:@"xml"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:xmlPath];
    
    //2.使用DOM方式来解析
    //2.1 创建GDataXMLDocument对象，将data绑定
    NSError *error = nil;
    GDataXMLDocument *xmlDoc = [[GDataXMLDocument alloc] initWithData:data options:0 error:&error];

    //2.2 获取xml文档的根元素 (Party)
    GDataXMLElement *rootElement = xmlDoc.rootElement;
    
    //3.解析xml的文件
    //从一个元素名字来找对应的那个/那些个元素对象
    NSArray *playerArray = [rootElement elementsForName:@"Player"];
    
    //循环解析
    for (GDataXMLElement *xmlElement in playerArray) {
        NSArray *nameArray = [xmlElement elementsForName:@"Name"];
        GDataXMLElement *nameElement = nameArray[0];
        NSString *nameStr = nameElement.stringValue;
        NSLog(@"play name:%@", nameStr);
        
        NSArray *levelArray = [xmlElement elementsForName:@"Level"];
        GDataXMLElement *levelElement = levelArray[0];
        NSString *levelStr = levelElement.stringValue;
        NSLog(@"level is %@", levelStr);
    }

}



@end
