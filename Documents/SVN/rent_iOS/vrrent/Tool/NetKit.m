//
//  NetKit.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/6.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "NetKit.h"
#import <AFNetworking.h>
#import "Const.h"

@interface NetKit () {
    
    __strong AFHTTPSessionManager *manager;
}
@end

static NetKit *sharedKit;

@implementation NetKit

+ (instancetype)kit {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedKit = [[NetKit alloc] init];
    });
    return sharedKit;
}

- (instancetype)init {
    if (self = [super init]) {
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_API]];
        
        AFJSONResponseSerializer *jsonser = [AFJSONResponseSerializer serializer];
        //		jsonser.readingOptions = NSJSONReadingAllowFragments;
        manager.responseSerializer = jsonser;
        
        //		NSMutableSet *acceptset = [manager.responseSerializer.acceptableContentTypes mutableCopy];
        //		[acceptset addObject:@"text/html"];
        //		manager.responseSerializer.acceptableContentTypes = [acceptset copy];
    }
    return self;
}

- (void)POSTWithURLString:(NSString *)URLString parameters:(NSDictionary *)params success:(void (^)(id))success error:(void (^)(NSInteger, NSString *, id))apierror failure:(void (^)(NSError *))failure {
    
    [manager POST:URLString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"code"] integerValue] == 100) {
            success(responseObject);
        } else {
            apierror([responseObject[@"code"] integerValue], responseObject[@"msg"], responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        
    }];
}

- (void)GETWithURLString:(NSString *)URLString parameters:(NSDictionary *)params success:(void (^)(id))success error:(void (^)(NSInteger, NSString *, id))apierror failure:(void (^)(NSError *))failure{
    
    //输出参数
    CGLog(@"参数:paramentDic=%@",params);
    [manager GET:URLString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"code"] integerValue] == 100)//103表示没有数据
        {
            success(responseObject);
        } else {
            apierror([responseObject[@"code"] integerValue], responseObject[@"msg"],
                     responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}

- (void)multiFileFormDataPOST:(NSString *)URLString parameters:(NSDictionary *)param files:(NSArray *)files success:(void (^)(id))success error:(void (^)(NSInteger, NSString *, id))apierror failure:(void (^)(NSError *))failure{
    
    [manager POST:URLString parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [files enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *imageName = [NSString stringWithFormat:@"files[%ld]",(unsigned long)idx];
            NSData *fileData = [NSData dataWithContentsOfFile:files[idx]];
            if (fileData) {
                [formData appendPartWithFileData:fileData name:@"files[]" fileName:imageName mimeType:@"image/jpeg"];
            }
            
        }];
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"code"] integerValue] == 100) {
            success(responseObject);
        } else {
            apierror([responseObject[@"code"] integerValue], responseObject[@"msg"], responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)multipartFormDataPOST:(NSString *)URLString parameters:(NSDictionary *)param andImage:(UIImage *)image success:(void (^)(id))success error:(void (^)(NSInteger, NSString *, id))apierror failure:(void (^)(NSError *))failure {
    
    [manager POST:URLString parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (image != nil) {
            [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 1.0)
                                        name:@"file"
                                    fileName:[NSString stringWithFormat:@"%@.jpg", [NSNumber numberWithInt:(int)[[NSDate date]  timeIntervalSince1970]]]
                                    mimeType:@"image/jpeg"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"code"] integerValue] == 100) {
            success(responseObject);
        } else {
            apierror([responseObject[@"code"] integerValue], responseObject[@"msg"], responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)pGETWithURLString:(NSString *)URLString parameters:(NSArray *)params success:(void (^)(id))success error:(void (^)(NSInteger, NSString *, id))apierror failure:(void (^)(NSError *))failure {
    
    NSString *paramstr = nil;
    if (params == nil || [params count] == 0) {
        paramstr = @"";
    } else if ([params count] == 1) {
        paramstr = [NSString stringWithFormat:@"?%@", [params lastObject]];
    } else {
        for (int i = 0; i < [params count]; i++) {
            if (i == 0) {
                paramstr = [NSString stringWithFormat:@"?%@", params[0]];
            } else {
                paramstr = [paramstr stringByAppendingFormat:@"&%@", params[i]];
            }
        }
    }
    
    
    [manager GET:[URLString stringByAppendingFormat:@"%@", paramstr] parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"code"] integerValue] == 100) {
            success(responseObject);
        } else {
            apierror([responseObject[@"code"] integerValue], @""/**responseObject[@"msg"]*/,
                     responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
    
    
}

@end