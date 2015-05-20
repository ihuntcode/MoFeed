//
//  CoreDataManager.h
//  Feedler
//
//  Created by VJ on 5/19/15.
//  Copyright (c) 2015 VJ. All rights reserved.
//
#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Feed.h"
@interface CoreDataManager : NSObject
{
    NSManagedObjectContext* managedContext;
}

@property(nonatomic,strong)NSManagedObjectContext* managedContext;


-(BOOL)insertFeedlerObject:(NSDictionary*)feedModel;
-(NSArray*)getAllEntitiesOn:(NSString*)modelName;
@end
