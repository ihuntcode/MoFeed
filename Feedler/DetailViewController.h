//
//  DetailViewController.h
//  Feedler
//
//  Created by VJ on 5/20/15.
//  Copyright (c) 2015 VJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feed.h"
@interface DetailViewController : UIViewController
{
    
}
@property(nonatomic,strong) Feed *feedItem;
@property(nonatomic,strong)IBOutlet UIWebView *webView;

@end
