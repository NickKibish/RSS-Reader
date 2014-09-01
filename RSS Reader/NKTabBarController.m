//
//  NKTabBarController.m
//  RSS Reader
//
//  Created by Nick Kibish on 07.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import "NKTabBarController.h"
#import "NKNewsView.h"
#import "NKFavoriteViewController.h"

@interface NKTabBarController ()

@end

@implementation NKTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *controllers = self.viewControllers;
    
    UINavigationController *firstController = [controllers objectAtIndex:0];
    UINavigationController *secondController = [controllers objectAtIndex:1];
        
    self.news = [firstController.viewControllers objectAtIndex:0];
    self.favView = [secondController.viewControllers objectAtIndex:0];
    
    self.favView.mainTable = self.news;
    self.news.favTableController = self.favView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc
               inOrientation:(UIInterfaceOrientation)orientation
{
    return NO;
}

@end
