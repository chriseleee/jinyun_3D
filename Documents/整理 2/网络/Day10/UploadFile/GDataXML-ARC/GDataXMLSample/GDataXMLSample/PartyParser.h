//
//  PartyParser.h
//  GDataXMLSample
//
//  Created by iC on 2/26/13.
//  Copyright (c) 2013 iC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  Party;

@interface PartyParser : NSObject
+(Party*)loadParty;
+(void)saveParty:(Party *)party;
@end
