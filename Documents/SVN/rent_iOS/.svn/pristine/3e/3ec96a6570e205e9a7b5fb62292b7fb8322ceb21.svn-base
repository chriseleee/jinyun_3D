//
//  NetKit.h
//  vrrent
//
//  Created by 龚俊平 on 16/5/6.
//  Copyright © 2016年 golden. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface NetKit : NSObject

+ (instancetype)kit;

- (void)POSTWithURLString:(NSString *)URLString
               parameters:(NSDictionary *)params
                  success:(void (^)(id ret))success
                    error:(void (^)(NSInteger code, NSString *msg, id ret))apierror
                  failure:(void (^)(NSError *error))failure;

- (void)pGETWithURLString:(NSString *)URLString
               parameters:(NSArray *)params
                  success:(void (^)(id ret))success
                    error:(void (^)(NSInteger code, NSString *msg, id ret))apierror
                  failure:(void (^)(NSError *error))failure;

- (void)GETWithURLString:(NSString *)URLString
              parameters:(NSDictionary *)params
                 success:(void (^)(id ret))success
                   error:(void (^)(NSInteger code, NSString *msg, id ret))apierror
                 failure:(void (^)(NSError *error))failure;

- (void)multipartFormDataPOST:(NSString *)URLString
                   parameters:(NSDictionary *)param
                     andImage:(UIImage *)image
                      success:(void (^)(id ret))success
                        error:(void (^)(NSInteger code, NSString *msg, id ret))apierror
                      failure:(void (^)(NSError *error))failure;

- (void)multiFileFormDataPOST:(NSString *)URLString parameters:(NSDictionary *)param files:(NSArray *)files success:(void (^)(id))success error:(void (^)(NSInteger, NSString *, id))apierror failure:(void (^)(NSError *))failure;

@end