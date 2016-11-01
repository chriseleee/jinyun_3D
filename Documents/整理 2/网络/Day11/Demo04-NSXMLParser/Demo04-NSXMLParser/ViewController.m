//
//  ViewController.m
//  Demo04-NSXMLParser
//
//  Created by tarena on 15/9/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSXMLParserDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取xml文件中的数据
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"Party" ofType:@"xml"];
    NSData *xmlData = [[NSData alloc] initWithContentsOfFile:xmlPath];
    
    //创建个NSXMLParser对象 (SAX解析)
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
    
    //设置代理
    parser.delegate = self;
    
    //执行解析动作
    [parser parse];
}

#pragma mark -- NSXMLParser delegate
//解析文档的开始调用方法
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"文档解析开始啦");
    
}

//解析到某一个元素的开始调用方法
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    NSLog(@"开始解析元素: %@",elementName);
    NSLog(@"当前元素属性:%@", attributeDict);
}

//解析到某一个元素结束的调用方法
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"元素解析完毕:%@", elementName);
}

//获取元素对应的值
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"元素的值：%@", string);
}

//整个xml文档都解析完毕调用方法
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"解析完毕啦");
}












@end
