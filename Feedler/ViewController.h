//
//  ViewController.h
//  Feedler
//
//  Created by VJ on 5/19/15.
//  Copyright (c) 2015 VJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataManager.h"
#import "DataRequestManager.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}

@property(nonatomic,strong)IBOutlet UITableView *feedList;
@end

