//
//  NKWebViewController.m
//  RSS Reader
//
//  Created by Nick Kibish on 06.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import "NKWebViewController.h"
#include "NKXMLParser.h"

@interface NKWebViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@end

@implementation NKWebViewController
@synthesize mainUrl = mainUrl_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self reorient];
    [self loadFromUrl:self.mainUrl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadFromUrl:(NSString *)urlAddress
{
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
}

- (void) reorient
{
    UIInterfaceOrientation orient = [[UIApplication sharedApplication] statusBarOrientation];
    if (orient == UIInterfaceOrientationPortrait) {
        CGRect frame = [UIScreen mainScreen].applicationFrame;
        self.webView.frame = frame;
        
    } else {
        CGRect frame = [UIScreen mainScreen].applicationFrame;
        CGSize s = frame.size;
        CGRect f2;
        f2.size.width = s.height;
        f2.size.height = s.width;
        
        self.webView.frame = f2;
    }
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self reorient];
}
@end
