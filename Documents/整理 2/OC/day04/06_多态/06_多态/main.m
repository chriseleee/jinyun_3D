//
//  main.m
//  06_多态
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRDog.h"
#import "TRCat.h"

//多态概念
void test()
{
    TRAnimal *a;
    a = [[TRDog alloc] initWithName:@"pulot" andAge:5];//用父类的指针指向子类的对象
    [a eat];//用基类指针a可以调用派生类TRDog中重写的方法
    [a sleep];
    //[a watchHome];//用基类指针a不能调用派生类TRDog中自己定义的方法
    
    TRCat *cat = [[TRCat alloc]initWithName:@"可可" andAge:3];
    a = cat;
    [a eat];//用基类指针a可以调用派生类TRCat中重写的方法
}

//多态在函数参数上的应用
void show(TRAnimal *a)
{
    [a eat];
    [a sleep];
}

void test2()
{
    TRDog *dog = [[TRDog alloc] init];
    show(dog);
    TRCat *cat = [[TRCat alloc] init];
    show(cat);
}


//多态在数组上的应用
void test3()
{
    TRAnimal *animal[3];
    animal[0] = [[TRAnimal alloc] init];
    animal[1] = [[TRDog alloc] init];
    animal[2] = [[TRCat alloc] init];
    
    for (int i = 0; i < 3; i++)
    {
        [animal[i] eat];
    }
}


//多态在函数返回值上的应用
enum ANIMALS
{
    ANIMAL,
    DOG,
    CAT,
};

TRAnimal* get(enum ANIMALS type);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRAnimal *ani = get(DOG);
        [ani eat];
        ani = get(CAT);
        [ani eat];
    }
    return 0;
}


TRAnimal * get(enum ANIMALS type)
{
    switch (type)
    {
        case ANIMAL:
            return [[TRAnimal alloc] init];
        case DOG:
            return [[TRDog alloc] init];
        case CAT:
            return [[TRCat alloc] init];
    }
    return  nil;
}
