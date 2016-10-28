//
//  MemberModel.h
//
//  Created by yangwei  on 16/4/13
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MemberModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, assign) double phone;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *registerTime;
@property (nonatomic, strong) NSString *headIcon;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
