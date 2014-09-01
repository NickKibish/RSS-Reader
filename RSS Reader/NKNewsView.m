//
//  NKNewsView.m
//  RSS Reader
//
//  Created by Nick Kibish on 06.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import "NKNewsView.h"
#import "NKWebViewController.h"
#import "NKXMLParser.h"
#import "NKFavoriteViewController.h"

@interface NKNewsView ()

@end

@implementation NKNewsView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NKXMLParser *del = (NKXMLParser *)self.tableView.delegate;
    del.news = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"opeURLFromAllNews"]) {
        NKXMLParser *del = (NKXMLParser *)self.tableView.delegate;
        NSIndexPath *indPath = [self.tableView indexPathForSelectedRow];
        NKXMLElement *el = [del.items objectAtIndex:indPath.row];
        NSString *link = [el findUrl];
        
        NKWebViewController *webView = segue.destinationViewController;
        webView.mainUrl = link;
        [webView loadFromUrl:webView.mainUrl];
    }
}

@end
