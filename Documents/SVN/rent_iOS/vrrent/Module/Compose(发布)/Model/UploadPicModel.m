//
//  UploadPicModel.m
//  wangle
//
//  Created by yw on 15/11/25.
//
//

#import "UploadPicModel.h"

@implementation UploadPicModel

- (NSString *)description
{
    return [NSString stringWithFormat:@"picPath:%@--uploadId:%@",_picPath,_uploadId];
}
@end
