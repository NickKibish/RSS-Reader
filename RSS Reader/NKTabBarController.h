//
//  NKTabBarController.h
//  RSS Reader
//
//  Created by Nick Kibish on 07.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NKNewsView;
@class NKFavoriteViewController;

@interface NKTabBarController : UITabBarController
@property (strong, nonatomic) NKNewsView *news;
@property (strong, nonatomic) NKFavoriteViewController *favView;

@end
