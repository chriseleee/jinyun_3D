//
//  CGFileManager.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/7.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "CGFileManager.h"

@implementation SharedWithHD

+(NSString *)getDocumentFilePath:(NSString *)kFile{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDic = [paths objectAtIndex:0];
    
    return [documentsDic stringByAppendingPathComponent:kFile];
}
+(NSString *)getCachesFilePath:(NSString *)kFile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDic = [paths objectAtIndex:0];
    
    return [documentsDic stringByAppendingPathComponent:kFile];
}
@end

@implementation CGFileManager

+(id)readDocumentfile:(NSString *)kFile{
    id ret = nil;
    
    NSString *filePath = [SharedWithHD getDocumentFilePath:kFile];
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        //恢复数据
        NSData *data = [[NSData alloc]initWithContentsOfFile:filePath];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        
        ret = [unarchiver decodeObjectForKey:kFile];
        [unarchiver finishDecoding];
    }
    return ret;
}

+(BOOL)hasDocumentCreateFile:(NSString *)kFile{
    NSString *filePath = [SharedWithHD getDocumentFilePath:kFile];
    return [[NSFileManager defaultManager]fileExistsAtPath:filePath];
}

+(BOOL)writeDocumentFile:(NSString *)kFile forObject:(id)object{
    
    NSString *documentsPath = [SharedWithHD getDocumentFilePath:kFile];
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    [archiver encodeObject:object forKey:kFile];
    [archiver finishEncoding];
    
    BOOL success = [data writeToFile:documentsPath atomically:YES];
    
    return success;
}

+(NSError*)moveDocumentItemAtPath:(NSString *)currentPath toPath:(NSString *)kFile{
//    NSString *filePath = [SharedWithHD getDocumentFilePath:kFile];
    NSError *moveError = nil;
    [[NSFileManager defaultManager] moveItemAtPath:currentPath toPath:kFile error:&moveError];
    return moveError;
}
//+(NSError *)moveDocumentItemAtPath:(NSString *)currentPath toPath:(NSString *)kFile forKey:(NSString *)keyS{
//    NSError *moveError = nil;
//    NSString *path = [currentPath stringByAppendingString:keyS];
//    [[NSFileManager defaultManager] moveItemAtPath:currentPath toPath:kFile error:&moveError];
//    return moveError;
//}
+(id)readCachesfile:(NSString *)kFile{
    id ret = nil;
    
    NSString *filePath = [SharedWithHD getCachesFilePath:kFile];
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        NSData *data = [[NSData alloc]initWithContentsOfFile:filePath];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        
        ret = [unarchiver decodeObjectForKey:kFile];
        [unarchiver finishDecoding];
        
    }
    return ret;
}
+(id)readCachesfile:(NSString *)kFile forKey:(NSString*)keyS{
    id ret = nil;
    NSString*path = [kFile stringByAppendingString:keyS];
    NSString *filePath = [SharedWithHD getCachesFilePath:path];
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        NSData *data = [[NSData alloc]initWithContentsOfFile:filePath];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        
        ret = [unarchiver decodeObjectForKey:keyS];
        [unarchiver finishDecoding];
        
    }
    return ret;
}

+(BOOL)hasCachesCreateFile:(NSString *)kFile{
    NSString *filePath = [SharedWithHD getCachesFilePath:kFile];
    return [[NSFileManager defaultManager]fileExistsAtPath:filePath];
}

+(BOOL)writeCachesFile:(NSString *)kFile forObject:(id)object{
    
    NSString *filePath = [SharedWithHD getCachesFilePath:kFile];
    
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    [archiver encodeObject:object forKey:kFile];
    [archiver finishEncoding];
    
    BOOL success = [data writeToFile:filePath atomically:YES];
    
    return success;
}
+(BOOL)writeCachesFile:(NSString *)kFile forObject:(id)object forKey:(NSString*)keyS{
    NSString* path = [kFile stringByAppendingString:keyS];
    NSString *filePath = [SharedWithHD getCachesFilePath:path];
    
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    [archiver encodeObject:object forKey:keyS];
    [archiver finishEncoding];
    
    BOOL success = [data writeToFile:filePath atomically:YES];
    
    return success;
}


+(NSError*)moveCachesItemAtPath:(NSString *)currentPath toPath:(NSString *)kFile{
    NSString *filePath = [SharedWithHD getCachesFilePath:kFile];
    NSError *moveError = nil;
    [[NSFileManager defaultManager] moveItemAtPath:currentPath toPath:kFile error:&moveError];
    return moveError;
}


@end
