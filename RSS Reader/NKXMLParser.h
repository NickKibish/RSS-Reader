//
//  NKXMLParser.h
//  Network Test
//
//  Created by Nick Kibish on 02.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKXMLElement.h"

@class NKNewsView;
@interface NKXMLParser : NSObject <NSXMLParserDelegate, UITableViewDelegate, UITableViewDataSource>
{
    NSString *html;
}

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSMutableArray *favoriteItems;
@property (nonatomic, strong) NSString* html;
@property (nonatomic, strong) NSXMLParser* parser;
@property (nonatomic, strong) NKXMLElement *rootElement;
@property (nonatomic, strong) NKXMLElement *currentElementPointer;
@property (nonatomic, strong) NKNewsView *news;

-(id)initWithURL:(NSString *)urlAsString;
-(NSMutableArray *)findItems;
-(void) saveData;

@end
