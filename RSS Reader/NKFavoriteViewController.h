//
//  NKFavoriteViewController.h
//  RSS Reader
//
//  Created by Nick Kibish on 07.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NKXMLParser.h"
#import "NKNewsView.h"
#import "NKWebViewController.h"

@interface NKFavoriteViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NKNewsView *mainTable;
@property (strong, nonatomic) IBOutlet UITableView *table;

@end
