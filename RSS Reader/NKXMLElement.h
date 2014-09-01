//
//  NKXMLElement.h
//  Network Test
//
//  Created by Nick Kibish on 03.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKXMLElement : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSDictionary *attributes;
@property (nonatomic, strong) NSMutableArray *subElements;
@property (nonatomic, weak) NKXMLElement *parent;

-(NSString *) findUrl;

@end
