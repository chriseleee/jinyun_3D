//
//  MemberModel.m
//
//  Created by yangwei  on 16/4/13
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MemberModel.h"


NSString *const kMemberModelId = @"id";
NSString *const kMemberModelPhone = @"phone";
NSString *const kMemberModelNickName = @"nickName";
NSString *const kMemberModelRegisterTime = @"registerTime";
NSString *const kMemberModelHeadIcon = @"headIcon";


@interface MemberModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MemberModel

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize phone = _phone;
@synthesize nickName = _nickName;
@synthesize registerTime = _registerTime;
@synthesize headIcon = _headIcon;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kMemberModelId fromDictionary:dict] doubleValue];
            self.phone = [[self objectOrNilForKey:kMemberModelPhone fromDictionary:dict] doubleValue];
            self.nickName = [self objectOrNilForKey:kMemberModelNickName fromDictionary:dict];
            self.registerTime = [self objectOrNilForKey:kMemberModelRegisterTime fromDictionary:dict];
            self.headIcon = [self objectOrNilForKey:kMemberModelHeadIcon fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kMemberModelId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.phone] forKey:kMemberModelPhone];
    [mutableDict setValue:self.nickName forKey:kMemberModelNickName];
    [mutableDict setValue:self.registerTime forKey:kMemberModelRegisterTime];
    [mutableDict setValue:self.headIcon forKey:kMemberModelHeadIcon];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kMemberModelId];
    self.phone = [aDecoder decodeDoubleForKey:kMemberModelPhone];
    self.nickName = [aDecoder decodeObjectForKey:kMemberModelNickName];
    self.registerTime = [aDecoder decodeObjectForKey:kMemberModelRegisterTime];
    self.headIcon = [aDecoder decodeObjectForKey:kMemberModelHeadIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kMemberModelId];
    [aCoder encodeDouble:_phone forKey:kMemberModelPhone];
    [aCoder encodeObject:_nickName forKey:kMemberModelNickName];
    [aCoder encodeObject:_registerTime forKey:kMemberModelRegisterTime];
    [aCoder encodeObject:_headIcon forKey:kMemberModelHeadIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    MemberModel *copy = [[MemberModel alloc] init];
    
    if (copy) {

        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.phone = self.phone;
        copy.nickName = [self.nickName copyWithZone:zone];
        copy.registerTime = [self.registerTime copyWithZone:zone];
        copy.headIcon = [self.headIcon copyWithZone:zone];
    }
    
    return copy;
}


@end
