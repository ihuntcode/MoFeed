//
//  DetailViewController.m
//  Feedler
//
//  Created by VJ on 5/20/15.
//  Copyright (c) 2015 VJ. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
{
    UIProgressView *progressView;
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *url=[[NSURL alloc]initWithString:self.feedItem.feedLink];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    [self.webView setDelegate:self];
    
    self.navigationItem.title=@"Business Insider";
    
    progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    [progressView setProgress:50.0 animated:YES];

    [self.webView addSubview:progressView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)webViewDidStartLoad:(UIWebView *)webView
{

}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [progressView setProgress:100.0 animated:YES];
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}
@end
