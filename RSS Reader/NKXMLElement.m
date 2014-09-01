//
//  NKXMLElement.m
//  Network Test
//
//  Created by Nick Kibish on 03.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import "NKXMLElement.h"

@implementation NKXMLElement

- (NSMutableArray *) subElements
{
    if (_subElements == nil){
        _subElements = [[NSMutableArray alloc] init];
    }
    return _subElements;
}

- (NSString *) findUrl
{
    NSString *result = @"";
    for (NKXMLElement *el in _subElements) {
        if ([el.name isEqualToString:@"link"]) {
            result = el.text;
        }
    }
    
    return result;
}

@end
