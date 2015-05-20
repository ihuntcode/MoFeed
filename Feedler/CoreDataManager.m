//
//  CoreDataManager.m
//  Feedler
//
//  Created by VJ on 5/19/15.
//  Copyright (c) 2015 VJ. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

@synthesize managedContext;


-(id)init
{
    id delegate = [[UIApplication sharedApplication] delegate];
    self.managedContext = [delegate managedObjectContext];
    
    return self;
}

#pragma mark CoreData 

-(NSManagedObjectContext*)managedContext
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    managedContext = [appDelegate managedObjectContext];
    
    
    return managedContext;
}

-(BOOL)insertFeedlerObject:(NSDictionary*)feedModel
{
    
    
    Feed *newFeed= [NSEntityDescription insertNewObjectForEntityForName:@"Feed" inManagedObjectContext:managedContext];
    

//    newFeed.feedDate=@"asdfads";
//    newFeed.feedDesc=@"adasdfasdf";
//    newFeed.feedGuid=@"asdfasdfasdfasdf";
//    newFeed.feedTitle=@"Yes yes";
//    newFeed.feedLink=@"adfasdasdfas";
    
    
    newFeed.feedDate= [feedModel valueForKey:@"feedDate"];
    newFeed.feedDesc=[feedModel valueForKey:@"feedDesc"];
    newFeed.feedGuid=[feedModel valueForKey:@"feedGuid"];
    newFeed.feedTitle=[feedModel valueForKey:@"feedTitle"];
    newFeed.feedLink=[feedModel valueForKey:@"feedLink"];
    
    
    NSError *error;
    [managedContext save:&error];
    
    if (error== nil) {
        return YES;
    }
    else
        return NO;
}

-(NSArray*)getAllEntitiesOn:(NSString*)modelName
{
    
    
    NSEntityDescription *entityDesc =[NSEntityDescription entityForName:modelName
                inManagedObjectContext:self.managedContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    [request setReturnsObjectsAsFaults:NO];
    
    NSPredicate *pred =[NSPredicate predicateWithFormat:nil];
    
    [request setPredicate:pred];
//    NSManagedObject *matches = nil;
    
    NSError *error;
    NSArray *objects = [self.managedContext executeFetchRequest:request
                                              error:&error];
    
    return objects;
}

@end
