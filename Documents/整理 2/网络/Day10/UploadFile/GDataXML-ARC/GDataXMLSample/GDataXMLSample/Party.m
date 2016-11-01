//
//  Party.m
//  GDataXMLSample
//
//  Created by iC on 2/26/13.
//  Copyright (c) 2013 iC. All rights reserved.
//

#import "Party.h"

@implementation Party
-(id)init {
    self = [super init];
    if (self) {
        self.players = [[NSMutableArray alloc]init];
    }
    return self;
}
@end
