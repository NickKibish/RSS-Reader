//
//  NKFavoriteViewController.m
//  RSS Reader
//
//  Created by Nick Kibish on 07.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import "NKFavoriteViewController.h"
#import "NKWebViewController.h"
#import "NKXMLParser.h"
#import "NKFavCell.h"

@interface NKFavoriteViewController ()

@end

@implementation NKFavoriteViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        NSLog(@"Fav");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"openURLFromFavorite"]) {
        NKXMLParser *del = (NKXMLParser *)self.mainTable.tableView.delegate;
        NSIndexPath *indPath = [self.tableView indexPathForSelectedRow];
        NSString *link = [del.favoriteItems objectAtIndex:indPath.row];
        
        NKWebViewController *webView = segue.destinationViewController;
        webView.mainUrl = link;
        [webView loadFromUrl:webView.mainUrl];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NKXMLParser *pars = (NKXMLParser *)self.mainTable.tableView.delegate;
    NSInteger rows = [pars.favoriteItems count];
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableViewCellIdentifier = @"FavCell";
    NKFavCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
    if (!cell) {
        cell = [[NKFavCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:TableViewCellIdentifier];
    }
    
    NSInteger row = indexPath.row;
    NKXMLParser *delegate = (NKXMLParser *)self.mainTable.tableView.delegate;
    NSString *link = [delegate.favoriteItems objectAtIndex:row];
    NKXMLElement *element = nil;
    for (NKXMLElement *el in delegate.items) {
        NSString *elLink = [el findUrl];
        if ([link isEqualToString:elLink]) {
            element = el;
            break;
        }
    }
    
    for (NKXMLElement *title in element.subElements) {
        if ([title.name isEqualToString:@"title"]) {
            cell.title.text = title.text;
        }
        if ([title.name isEqualToString:@"description"]) {
            cell.description.text = title.text;
        }
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NKXMLParser *del = (NKXMLParser *)self.mainTable.tableView.delegate;
    NSString *link = [del.favoriteItems objectAtIndex:indexPath.row];
    [self.mainTable.web loadFromUrl:link];
    NSLog(@"%d", self.mainTable.web);
}

@end
