//
//  main.m
//  03_NSDictionary
//
//  Created by tarena on 15/7/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu1 = [[TRStudent alloc]init];
        stu1.name = @"zhangsan";
        stu1.age = 18;
        TRStudent *stu2 = [[TRStudent alloc]init];
        stu2.name = @"lisi";
        stu2.age = 20;
        
        //创建字典的标准方法
        NSDictionary*dict1= [NSDictionary dictionaryWithObjectsAndKeys:stu1,@"1",stu2,@"2", nil];
        //由数组创建
        NSArray *objects = @[stu1,stu2];
        NSArray *keys = @[@"1",@"2"];
        NSDictionary* dict2 = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        //复制一个字典
        NSDictionary *dict3 = [NSDictionary dictionaryWithDictionary:dict2];
        //获取字典中键值对的个数
        NSLog(@"%lu",dict3.count);
        //获取字典中所有关键字
        NSArray* keys1 = [dict3 allKeys];
        //通过对象获取关键字
        NSDictionary* dict4 = [NSDictionary dictionaryWithObjectsAndKeys:stu1,@"1",stu2,@"2",stu1,@"3", nil];
        NSArray* keys2 = [dict4 allKeysForObject:stu1];
        //通过关键字找到相应的值
        TRStudent *stu3 = [dict4 objectForKey:@"1"];
        //获取字典中的所有值
        NSArray *values = [dict4 allValues];
        //根据多个关键字，同时找到多个值
        NSArray* keys3 = @[@"1",@"4"];
        NSArray* values1 = [dict4 objectsForKeys:keys3 notFoundMarker:@"no-found"];
        //创建优化
        NSDictionary* dict5 = @{@"1":stu1,@"2":stu2};
        //获取优化
        NSLog(@"%@",dict5[@"2"]);
        //对字典的值进行排序后，得到关键字的顺序
        NSArray* sortedk = [dict5 keysSortedByValueUsingSelector:@selector(compareName:)];
        NSLog(@"%@",sortedk);
        for(NSString* key in sortedk)
        {
            NSLog(@"%@:%@",key,dict5[key]);
        }
        //普通遍历方法
        NSArray* keys4 = [dict5 allKeys];
        for (int i = 0; i < keys4.count; i++) {
            NSLog(@"%@",dict5[keys4[i]]);
        }
        //通过枚举器遍历字典中所有的值对象
        NSEnumerator* e = [dict5 objectEnumerator];
        TRStudent *stu;
        while (stu = [e nextObject]) {
            NSLog(@"%@",stu);
        }
        //通过枚举器遍历字典中所有的关键字
        NSEnumerator *e1 = [dict5 keyEnumerator];
        NSString* key ;
        while (key = [e1 nextObject]) {
            NSLog(@"%@:%@",key,dict5[key]);
        }
        //快速遍历字典中所有关键字
        for (NSString* key in dict5) {
            NSLog(@"%@:%@",key,dict5[key]);
        }
    }
    return 0;
}



















