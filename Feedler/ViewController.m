//
//  ViewController.m
//  Feedler
//
//  Created by VJ on 5/19/15.
//  Copyright (c) 2015 VJ. All rights reserved.
//

#import "ViewController.h"
#import "ListViewCell.h"
#import "Feed.h"
#import "DetailViewController.h"
@interface ViewController ()
{
    CoreDataManager *manager;
    
    NSMutableArray *array;
}
@end

@implementation ViewController


@synthesize feedList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [feedList setDelegate:self];
    
    [feedList setDataSource:self];
    
    DataRequestManager *dataManager=[[DataRequestManager alloc]init];
    
    NSMutableArray *dicArray =[dataManager getRSSForURL];
    
     manager=[[CoreDataManager alloc]init];

    
    for (NSMutableDictionary *dic in dicArray)
    {
        [manager insertFeedlerObject:dic];

    }
    

    array=[[NSMutableArray alloc]initWithArray:[manager getAllEntitiesOn:@"Feed"]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma  mark TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListViewCell *cell=[self.feedList dequeueReusableCellWithIdentifier:@"ListViewCell"];
      
    if (cell) {
        
        Feed *feed=(Feed*)[array objectAtIndex:indexPath.row];
        
        [cell.title setText:feed.feedTitle];
        
        [cell.desc setText:feed.feedDesc];
        
    }
    
    return cell;
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender NS_AVAILABLE_IOS(5_0)
{
    if ([segue.identifier isEqual:@"DetailSegue"])
    {
        ListViewCell *cell=(ListViewCell *)sender;
        
        NSIndexPath *index=[self.feedList indexPathForCell:cell];
        
        Feed *item=[array objectAtIndex:index.row];
        
        DetailViewController *detailCtrl=(DetailViewController*)segue.destinationViewController;
        
        detailCtrl.feedItem=item;
        
        
        
    }
}
@end
