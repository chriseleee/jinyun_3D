//
//  main.m
//  day01-1
//
//  Created by tarena on 15/2/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL isEqual(int num1,int num2);
BOOL isEqual(int num1,int num2){
    return num1==num2;
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        int i = 10;
        char c = 'a';
        float f = 10.1f;
        double d = 20.1;
        /*
        if (<#condition#>) {
            <#statements#>
        }
        for (<#initialization#>; <#condition#>; <#increment#>) {
            <#statements#>
        }
        struct <#struct name#> {
            <#struct fields#>
        };
         */
        // insert code here...At
        NSLog(@"Hello, World!%d %c %f %lf",i,c,f,d);
        printf("Hello, World!%d %c %f %lf\n",10,'a',10.1f,20.1);
        //OC中的逻辑类型
        //BOOL isFlag = NO;//YES 1 NO 0
        BOOL isFlag = isEqual(1, 2);
        NSLog(@"isFlag:%d",isFlag);
        if (isFlag) {
            NSLog(@"逻辑值为真!");
        }else{
            NSLog(@"逻辑值为假!");
        }
    }
    return 0;
}




