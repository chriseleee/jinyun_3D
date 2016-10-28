//
//  Const.h
//  BaseDemo
//
//  Created by yw on 15/12/31.
//  Copyright © 2015年 yw. All rights reserved.
//

//应该使用FOUNDATION_EXPORT还是#define来定义常量?
//使用第一种方法在检测字符串的值是否相等的时候更快.对于第一种你可以直接使用(stringInstance == MyFirstConstant)来比较,而define则使用的是这种.([stringInstance isEqualToString:MyFirstConstant])

//哪个效率高,显而易见了.第一种直接比较的是指针地址,而第二个则是一一比较字符串的每一个字符是否相等.

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString * const kMyConstantString;
FOUNDATION_EXPORT NSString * const kMyConstantString2;

FOUNDATION_EXPORT float const ANIMATE;

FOUNDATION_EXPORT int const SECONDS;

FOUNDATION_EXPORT int const CURRENT_PAGE_SIZE;

FOUNDATION_EXPORT NSString *const VERIFICATION_CODE_COUNT_DOWN;

FOUNDATION_EXPORT NSString *const BASE_API;
FOUNDATION_EXPORT NSString *const IMAGE_API;

//USER DEFAULT KEY
FOUNDATION_EXPORT NSString *const AR_CURRENT_USER_ID;

//user info
FOUNDATION_EXPORT NSString *const AR_USER_INFO;

//catogery
FOUNDATION_EXPORT NSString *const AR_CATEGORY;

//service return error code
FOUNDATION_EXPORT int const SERVICE_ERROR_CODE_103;

