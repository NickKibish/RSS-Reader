//
//  NKCustomCell.m
//  RSS Reader
//
//  Created by Nick Kibish on 05.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import "NKCustomCell.h"
#import "NKNewsView.h"
#import "NKXMLParser.h"
#import "NKFavoriteViewController.h"

@implementation NKCustomCell
@synthesize rootView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSString *) findLink
{
    UITableView *table = rootView.tableView;
    
    NSIndexPath *indexPath = [table indexPathForCell:self];
    NKXMLParser *delegate = (NKXMLParser *)table.delegate;
    
    NKXMLElement *el = [[delegate items] objectAtIndex:indexPath.row];
    NSString *link = [el findUrl];
    return link;
}

- (IBAction)setFavorite:(UIButton *)sender
{
    BOOL isSelected = sender.selected;
    [sender setSelected:!isSelected];
    
    UITableView *table = rootView.tableView;
    NKXMLParser *delegate = (NKXMLParser *)table.delegate;
    
    NSString *link = [self findLink];
    
    if (isSelected) {   // - turn off
        for (NSString *url in delegate.favoriteItems) {
            if ([link isEqualToString:url]) {
                [delegate.favoriteItems removeObject:url];
                break;
            }
        }
    } else {            // - turn on
        [delegate.favoriteItems insertObject:[link copy] atIndex:0];
    }
    [delegate saveData];
    [rootView.favTableController.tableView reloadData];
}

- (IBAction)twit:(id)sender
{
    NSString *link = [self findLink];
    NSArray *itemArr = [NSArray arrayWithObjects:self.title.text, link, nil];
    UIActivityViewController *shareController = [[UIActivityViewController alloc]
                                                 initWithActivityItems:itemArr applicationActivities:nil];
    [self.rootView presentViewController:shareController animated:YES completion:nil];
}
@end
