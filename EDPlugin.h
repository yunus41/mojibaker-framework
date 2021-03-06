//
//  EDPlugin.h
//  EditorSDK
//
//  Created by Chris Corbyn on 24/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "EDLexer.h"

@class EDLexerStates;

@protocol EDPlugin <NSObject>

-(EDLexer *)lexerWithStates:(EDLexerStates *)states;

@end
