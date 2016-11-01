//
//  Player.m
//  GDataXMLSample
//
//  Created by iC on 2/26/13.
//  Copyright (c) 2013 iC. All rights reserved.
//

#import "Player.h"

@implementation Player
-(id)init {
    return [self initWithName:@"name" level:1 rpgClass:RPGClassFighter];
}

-(id)initWithName:(NSString *)name level:(int)level rpgClass:(RPGClass)class {
    self = [super init];
    if (self) {
        self.name = name;
        self.level = level;
        self.rpgClass = class;
    }
    return self;
}
@end
