//
//  TRExample.h
//  02_实例变量
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRExample : NSObject
{
    int i0;//默认的访问权限是保护的
    @public
    int i1;//此时，i1的访问权限是公有的
    @private
    int i2;//此时，i2的访问权限是私有的
    @protected
    int i3;//此时，i3的访问权限是保护的
    @package
    int i4;//此时，i4的访问权限是包内的
    //int _i5;
}
@property int i5;
@end
