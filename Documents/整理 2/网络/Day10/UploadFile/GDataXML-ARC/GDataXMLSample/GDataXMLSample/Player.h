//
//  Player.h
//  GDataXMLSample
//
//  Created by iC on 2/26/13.
//  Copyright (c) 2013 iC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    RPGClassFighter,
    RPGClassRogue,
    RPGClassWizard
} RPGClass;

@interface Player : NSObject
@property (copy, nonatomic) NSString *name;
@property (nonatomic) int level;
@property (nonatomic) RPGClass rpgClass;

-(id)initWithName:(NSString*)name level:(int)level rpgClass:(RPGClass)class;
@end
