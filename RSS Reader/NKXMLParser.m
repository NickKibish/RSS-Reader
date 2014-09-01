//
//  NKXMLParser.m
//  Network Test
//
//  Created by Nick Kibish on 02.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import "NKXMLParser.h"
#import "NKCustomCell.h"

static NSString *TableViewCellIdentifier = @"MyCell";
static NSString *url2 = @"http://developer.apple.com/news/rss/news.rss";

@implementation NKXMLParser
@synthesize parser;
@synthesize html;
@synthesize items;

-(id)initWithURL:(NSString *)urlAsString
{
    if (self = [super init]) {
        NSURL *url = [NSURL URLWithString:urlAsString];
        self.parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        self.parser.delegate = self;
        if ([parser parse]) {
            NSLog(@"Parsed");
        } else {
            NSLog(@"not parsed!!!");
        }
    }
    [self loadData];
    [self findItems];
    return self;
}

-(id)init
{
    NSString *url = url2;
    self = [self initWithURL:url];
    return self;
}

-(NSMutableArray *)findItems
{
    if (self.items == nil) {
        self.items = [[NSMutableArray alloc] init];
    }
    
    [self.items removeAllObjects];
    NKXMLElement *chanal = [self.rootElement.subElements objectAtIndex:0];
    
    for (NKXMLElement *item in chanal.subElements) {
        if ([[item name] isEqualToString:@"item"]) {
            [self.items addObject:item];
        }
    }
    return self.items;
}

#pragma mark Save and Load Data
- (void) saveData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.favoriteItems forKey:@"favoriteArray"];
    [defaults synchronize];
}

- (void) loadData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.favoriteItems = [defaults objectForKey:@"favoriteArray"];
    
    if (!self.favoriteItems) {
        self.favoriteItems = [[NSMutableArray alloc] init];
        NSLog(@"init");
    }
    
}

#pragma mark XML Parser
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    self.rootElement = nil;
    self.currentElementPointer = nil;
}

- (void)    parser:(NSXMLParser *)parser
   didStartElement:(NSString *)elementName
      namespaceURI:(NSString *)namespaceURI
     qualifiedName:(NSString *)qName
        attributes:(NSDictionary *)attributeDict
{
    if (self.rootElement == nil) {
        self.rootElement = [[NKXMLElement alloc] init];
        self.currentElementPointer = self.rootElement;
    } else {
        NKXMLElement *newElement = [[NKXMLElement alloc] init];
        newElement.parent = self.currentElementPointer;
        [self.currentElementPointer.subElements addObject:newElement];
        self.currentElementPointer = newElement;
    }
    self.currentElementPointer.name = elementName;
    self.currentElementPointer.attributes = attributeDict;
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([self.currentElementPointer.text length] > 0){ self.currentElementPointer.text = [self.currentElementPointer.text stringByAppendingString:string];
    } else {
        self.currentElementPointer.text = string;
    }
}

-(void) parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    self.currentElementPointer = self.currentElementPointer.parent;
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    self.currentElementPointer = nil;
}

#pragma mark Table View - Data Source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)    tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NKCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
    if (!cell) {
        cell = [[NKCustomCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:TableViewCellIdentifier];
    }
    
    NKXMLElement *el = (NKXMLElement *)[self.items objectAtIndex:indexPath.row];
    
    for (NKXMLElement *title in el.subElements) {
        if ([title.name isEqualToString:@"title"]) {
            cell.title.text = title.text;
        }
        if ([title.name isEqualToString:@"description"]) {
            cell.description.text = title.text;
        }
    }
    return cell;
}

#pragma mark Table View - Delegate
- (void)    tableView:(UITableView *)tableView
      willDisplayCell:(UITableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    NSString *link = [(NKXMLElement *)[items objectAtIndex:row] findUrl];
    
    for (NSString *url in self.favoriteItems) {
        NKCustomCell *cCell = (NKCustomCell *)cell;
        cCell.addToFavoriteBtn.selected = NO;
        if ([url isEqualToString:link]) {
            cCell.addToFavoriteBtn.selected = YES;
            break;
        }
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NKWebViewController *web = self.news.web;
    NSString *link = [(NKXMLElement *)[self.items objectAtIndex:indexPath.row] findUrl];
    [web loadFromUrl:link];
}

@end
