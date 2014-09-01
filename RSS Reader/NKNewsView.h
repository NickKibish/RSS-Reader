//
//  NKNewsView.h
//  RSS Reader
//
//  Created by Nick Kibish on 06.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NKWebViewController.h"

@class NKFavoriteViewController;
@interface NKNewsView : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NKFavoriteViewController *favTableController;
@property (strong, nonatomic) NKWebViewController *web;

@end
