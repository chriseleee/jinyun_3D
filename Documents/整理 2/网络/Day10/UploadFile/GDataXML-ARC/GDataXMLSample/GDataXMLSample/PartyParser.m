//
//  PartyParser.m
//  GDataXMLSample
//
//  Created by iC on 2/26/13.
//  Copyright (c) 2013 iC. All rights reserved.
//

#import "PartyParser.h"
#import "Party.h"
#import "GDataXMLNode.h"
#import "Player.h"

@implementation PartyParser
+(NSString *)dataFilePath:(BOOL)forSave {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths lastObject];
    NSString *documentsPath = [documentsDirectory stringByAppendingPathComponent:@"Party.xml"];
    if (forSave || [[NSFileManager defaultManager] fileExistsAtPath:documentsPath]) {
        return documentsPath;
    } else {
        return [[NSBundle mainBundle] pathForResource:@"Party" ofType:@"xml"];
    }
}

/*
 COMMENT 1
 Querying with XPath
 
 XPath is a simple syntax you can use to identify portions of an XML document.
 The easiest way to get a handle on it is by seeing a few examples.
 
 For example, the following XPath expression would identify all of the Player elements in our document:
 
 //Party/Player
 
 And the following would just identify the first Player element in our document:
 
 //Party/Player[1]
 
 And finally, the following would identify the player with the name of Shadow:
 
 //Party/Player[Name="Shadow"]
 
 Let’s see how we could use XPath by slightly modifying our loadParty method. Replace the line that loads the party members as the following:
 
 //NSArray *partyMembers = [doc.rootElement elementsForName:@"Player"];
 
 NSArray *partyMembers = [doc nodesForXPath:@"//Party/Player" error:nil];
 
 If you run the code, you’ll see the exact same results. So there isn’t an advantage of using XPath in this case,
 since we are interested in reading the entire XML document and constructing a model in memory.
 
 However, you can imagine that this could be pretty useful if we had a big complicated XML document and we wanted
 to quickly dig down to find a particular element, without having to look through the children of node A,
 then the children of node B, and so on until we find it.
*/

/*
 COMMENT 2
 
 This is the real meat of our work. We use the elementsForName method on our root element 
 to get all of the elements named “Player” underneath the root “Party” element.
 
 Then, for each “Player” element we look to see what “Name” elements are underneath that. 
 Our code only deals with one name, so we just take the first if there is more than one.
 
 We do similar processing for “Level” and “Class”, but for level we convert the string into an int, 
 and for class we convert the string into an enumeration.
 
 If anything fails, we just skip that Player. Otherwise, we construct a Player model object with the values we read from the XML, 
 and add it to our Party model object, and return that!
*/
+(Party *)loadParty {
    
    NSString *filePath = [self dataFilePath:NO];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData
                                                           options:0 error:&error];
    if (doc == nil) {
            return nil;
    }
    
    // See COMMENT 2.
    Party *party = [[Party alloc] init];
    
    NSArray *partyMembers = [doc.rootElement elementsForName:@"Player"]; // See COMMENT 1 for querying with XPath
    
    for (GDataXMLElement *partyMember in partyMembers) {
        NSString *name;
        int level;
        RPGClass rpgClass;
        
        // Name
        NSArray *names = [partyMember elementsForName:@"Name"];
        
        if (names.count > 0) {
            GDataXMLElement *firstName = (GDataXMLElement *) [names objectAtIndex:0];
            name = firstName.stringValue;
        } else continue;
        
        // Level
        NSArray *levels = [partyMember elementsForName:@"Level"];
        if (levels.count > 0) {
            GDataXMLElement *firstLevel = (GDataXMLElement *) [levels objectAtIndex:0];
            level = firstLevel.stringValue.intValue;
        } else continue;
        
        // Class
        NSArray *classes = [partyMember elementsForName:@"Class"];
        if (classes.count > 0) {
            GDataXMLElement *firstClass = (GDataXMLElement *) [classes objectAtIndex:0];
            if ([firstClass.stringValue caseInsensitiveCompare:@"Fighter"] == NSOrderedSame) {
                rpgClass = RPGClassFighter;
            } else if ([firstClass.stringValue caseInsensitiveCompare:@"Rogue"] == NSOrderedSame) {
                rpgClass = RPGClassRogue;
            } else if ([firstClass.stringValue caseInsensitiveCompare:@"Wizard"] == NSOrderedSame) {
                rpgClass = RPGClassWizard;
            } else {
                continue;
            }
        } else continue;
        
        Player *player = [[Player alloc] initWithName:name
                                                level:level
                                             rpgClass:rpgClass];
        [party.players addObject:player];
    }
    return party;
}

/*
 As you can see, GDataXML makes it quite easy and straightforward to construct our XML document. 
 You simply create elements with elementWithName: or elementWithName:stringValue, connect them 
 to each other with addChild, and then create a GDataXMLDocument specifying the root element. 
 In the end, you get an NSData that you can easily save to disk.
*/
+(void)saveParty:(Party *)party {
    
    GDataXMLElement * partyElement = [GDataXMLNode elementWithName:@"Party"];
    
    for(Player *player in party.players) {
        
        GDataXMLElement * playerElement = [GDataXMLNode elementWithName:@"Player"];
        GDataXMLElement * nameElement = [GDataXMLNode elementWithName:@"Name" stringValue:player.name];
        GDataXMLElement * levelElement = [GDataXMLNode elementWithName:@"Level" stringValue:
         
        [NSString stringWithFormat:@"%d", player.level]];
        
        NSString *classString;
        if (player.rpgClass == RPGClassFighter) {
            classString = @"Fighter";
        } else if (player.rpgClass == RPGClassRogue) {
            classString = @"Rogue";
        } else if (player.rpgClass == RPGClassWizard) {
            classString = @"Wizard";
        }
        GDataXMLElement * classElement = [GDataXMLNode elementWithName:@"Class" stringValue:classString];
        
        [playerElement addChild:nameElement];
        [playerElement addChild:levelElement];
        [playerElement addChild:classElement];
        [partyElement addChild:playerElement];
    }
    
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithRootElement:partyElement];
    NSData *xmlData = document.XMLData;
    
    NSString *filePath = [self dataFilePath:TRUE];
    NSLog(@"Saving xml data to %@...", filePath);
    [xmlData writeToFile:filePath atomically:YES];
}
@end
