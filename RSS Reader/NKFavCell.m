//
//  NKFavCell.m
//  RSS Reader
//
//  Created by Nick Kibish on 07.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import "NKFavCell.h"

@implementation NKFavCell

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

- (IBAction)ramoveFromFavorite:(UIButton *)sender
{
    UITableView *table = self.rootView.mainTable.tableView;
    NSIndexPath *indexPath = [self.rootView.tableView indexPathForCell:self];
    NKXMLParser *delegate = (NKXMLParser *)table.delegate;
    
    [delegate.favoriteItems removeObjectAtIndex: indexPath.row];
    [self.rootView.tableView reloadData];
    [self.rootView.mainTable.tableView reloadData];
}

- (IBAction)twit:(id)sender
{
    UITableView *table = self.rootView.mainTable.tableView;
    NSIndexPath *indexPath = [table indexPathForCell:self];
    NKXMLParser *delegate = (NKXMLParser *)table.delegate;
    
    NSString *link = [delegate.favoriteItems objectAtIndex:indexPath.row];
    
    NSArray *itemArr = [NSArray arrayWithObjects:self.title.text, link, nil];
    UIActivityViewController *shareController = [[UIActivityViewController alloc]
                                                 initWithActivityItems:itemArr applicationActivities:nil];
    [self.rootView presentViewController:shareController animated:YES completion:nil];
}
@end
