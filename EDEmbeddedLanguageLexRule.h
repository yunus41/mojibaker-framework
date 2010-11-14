//
//  EDEmbeddedLanguageLexRule.h
//  EditorSDK
//
//  Created by Chris Corbyn on 27/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "EDLexRule.h"

@class EDLexer;

@interface EDEmbeddedLanguageLexRule : EDLexRule {
	NSString *start;
	NSString *end;
	EDLexer *embeddedLexer;
	NSUInteger embeddedState;
}

+(id)ruleWithStart:(NSString *)startString end:(NSString *)endString lexer:(EDLexer *)aLexer
		usingState:(NSUInteger)stateId;
-(id)initWithStart:(NSString *)startString end:(NSString *)endString lexer:(EDLexer *)aLexer
		usingState:(NSUInteger)stateId;

@end
