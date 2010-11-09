//
//  EDExactMatchLexRule.m
//  Editor
//
//  Created by Chris Corbyn on 22/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EDExactMatchLexRule.h"
#import "EDLexicalToken.h"

@implementation EDExactMatchLexRule

+(id)ruleWithString:(NSString *)string caseInsensitive:(BOOL)caseFlag {	
	return [[[self alloc] initWithString:string caseInsensitive:caseFlag] autorelease];
}

-(id)initWithString:(NSString *)string caseInsensitive:(BOOL)caseFlag {
	if (self = [self init]) {
		needleString = caseFlag
			? [[string lowercaseString] copy]
			: [string copy]
			;
		caseInsensitive = caseFlag;
	}
	
	return self;
}

-(EDLexicalToken *)lexInString:(NSString *)string range:(NSRange)range states:(EDLexerStates *)states {
	if (range.length < needleString.length) {
		return nil;
	}
	
	EDLexicalToken *tok = nil;
	
	NSRange matchRange = NSMakeRange(range.location, needleString.length);
	NSString *rangeSubstring = [string substringWithRange:matchRange];
	
	if (caseInsensitive) {
		rangeSubstring = [rangeSubstring lowercaseString];
	}
	
	if ([rangeSubstring isEqualToString:needleString]) {
		tok = [EDLexicalToken tokenWithType:tokenType range:matchRange];
	}
	
	return tok;
}

-(void)dealloc {
	[needleString release];
	[super dealloc];
}

@end