//
//  CGFileManager.h
//  vrrent
//
//  Created by 龚俊平 on 16/5/7.
//  Copyright © 2016年 golden. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Document文件
 */
#define kProfileDocument_login		@"login.plist"


/**
 *  Caches文件
 */
#define kProfileCaches_homePageCell  @"homePageCell"
#define kProfileCaches_RentBarCell   @"RentBarCell"


@interface SharedWithHD : NSObject{
    
}
/**
 *  获取Document路径
 */
+(NSString *)getDocumentFilePath:(NSString *)kFile;
/**
 *  获取Caches路径
 */
+(NSString *)getCachesFilePath:(NSString *)kFile;

@end


@interface CGFileManager : NSObject
/**
 *  Document文件读取
 */
+(id)readDocumentfile:(NSString*)kFile;

/**
 *  Document文件写入
 */
+(BOOL)writeDocumentFile:(NSString*)kFile forObject:(id)object;


/**
 *  Document文件是否创建
 */
+(BOOL)hasDocumentCreateFile:(NSString*)kFile;
/**
 *  Document文件删除
 */
+(NSError*)moveDocumentItemAtPath:(NSString*)currentPath toPath:(NSString*)kFile;



/**
 *  Caches文件读取
 */
+(id)readCachesfile:(NSString *)kFile;
+(id)readCachesfile:(NSString *)kFile forKey:(NSString*)keyS;
/**
 *  Caches文件是否创建
 */
+(BOOL)hasCachesCreateFile:(NSString *)kFile;
/**
 *  Caches文件写入
 */
+(BOOL)writeCachesFile:(NSString *)kFile forObject:(id)object;
+(BOOL)writeCachesFile:(NSString *)kFile forObject:(id)object forKey:(NSString*)keyS;
/**
 *  Caches文件删除
 */
+(NSError*)moveCachesItemAtPath:(NSString *)currentPath toPath:(NSString *)kFile;



@end
