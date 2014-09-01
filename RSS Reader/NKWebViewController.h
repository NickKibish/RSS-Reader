//
//  NKWebViewController.h
//  RSS Reader
//
//  Created by Nick Kibish on 06.01.14.
//  Copyright (c) 2014 Nick Kibish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NKWebViewController : UIViewController <UISplitViewControllerDelegate>
{
    NSString *mainUrl_;
}
@property (strong, nonatomic) NSString *mainUrl;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

- (void) loadFromUrl:(NSString *)urlAddress;

@end
