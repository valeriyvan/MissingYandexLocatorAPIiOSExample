//
//  NSString+intHexValue.h
//  LBS
//
//  Created by Valeriy Van on 12.08.13.
//  Copyright (c) 2013 w7software.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (intHexValue)

-(int)intHexValue;
// The integer value of the receiver’s text, assuming a hex representation and skipping whitespace at the beginning of the string. Returns INT_MAX or INT_MIN on overflow. Returns 0 if the receiver doesn’t begin with a valid hex text representation of a number.

-(int)intHexValueWithPrefix:(BOOL)flag;
// The integer value of the receiver’s text, assuming a hex representation and skipping whitespace at the beginning of the string. Returns INT_MAX or INT_MIN on overflow. If flag is YES hex value should start with prefix 0x or 0X; returns 0 if the receiver doesn’t begin with a valid hex text representation of a number.

-(int)intValueRecognizingPrefix;
// The integer value of the receiver’s text, assuming a hex or decimal representation and skipping whitespace at the beginning of the string. Returns INT_MAX or INT_MIN on overflow. Returns 0 if the receiver doesn’t begin with a valid int (hex or decimal) text representation of a number.

@end
