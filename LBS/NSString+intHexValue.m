//
//  NSString+intHexValue.m
//  LBS
//
//  Created by Valeriy Van on 12.08.13.
//  Copyright (c) 2013 w7software.com. All rights reserved.
//

#import "NSString+intHexValue.h"

@implementation NSString (intHexValue)

-(int)intHexValue {
    unsigned int value;
    [[NSScanner scannerWithString:self] scanHexInt:&value];
    return (int)value; // приведение типов сознательно
}

-(int)intHexValueWithPrefix:(BOOL)flag {
    unsigned int value;
    NSScanner *scanner = [NSScanner scannerWithString:self];
    scanner.caseSensitive = NO;
    [scanner scanCharactersFromSet:[NSCharacterSet whitespaceAndNewlineCharacterSet] intoString:nil];
    if (flag && ![scanner scanString:@"0x" intoString:nil])
        return 0;
    [scanner scanHexInt:&value];
    return (int)value; // приведение типов сознательно
}

-(int)intValueRecognizingPrefix {
    unsigned int value;
    NSScanner *scanner = [NSScanner scannerWithString:self];
    scanner.caseSensitive = NO;
    [scanner scanCharactersFromSet:[NSCharacterSet whitespaceAndNewlineCharacterSet] intoString:nil];
    if ([scanner scanString:@"0x" intoString:nil]) {
        [scanner scanHexInt:&value];
    } else {
        [scanner scanInt:(int*)&value];
    }
    return (int)value; // приведение типов сознательно
}

@end