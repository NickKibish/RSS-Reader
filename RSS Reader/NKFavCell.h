//
//  NKFavCell.h
//  RSS Reader
//
//  Created by Nick Kibish on 07.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NKFavoriteViewController.h"

@interface NKFavCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *description;
@property (strong, nonatomic) IBOutlet UIButton *twitBtn;
@property (strong, nonatomic) IBOutlet NKFavoriteViewController *rootView;

- (IBAction)twit:(id)sender;
- (IBAction)ramoveFromFavorite:(UIButton *)sender;

@end
