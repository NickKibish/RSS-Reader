//
//  NKCustomCell.h
//  RSS Reader
//
//  Created by Nick Kibish on 05.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import "NKNewsView.h"

@interface NKCustomCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *description;
@property (strong, nonatomic) IBOutlet UIButton *addToFavoriteBtn;
@property (strong, nonatomic) IBOutlet UIButton *twitBtn;
@property (strong, nonatomic) IBOutlet NKNewsView *rootView;

- (IBAction)setFavorite:(UIButton *)sender;
- (IBAction)twit:(id)sender;

@end
