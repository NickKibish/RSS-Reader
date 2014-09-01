//
//  NKSplitView.m
//  RSS Reader
//
//  Created by Nick Kibish on 08.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import "NKSplitView.h"
#import "NKTabBarController.h"
#import "NKNewsView.h"

@interface NKSplitView ()

@end

@implementation NKSplitView

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
    NKTabBarController *tabBar = [self.viewControllers objectAtIndex:0];
    UINavigationController *navi = [self.viewControllers objectAtIndex:1];
    NKWebViewController *web = [navi.viewControllers objectAtIndex:0];
    tabBar.news.web = web;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation
{
    return NO;
}

@end
