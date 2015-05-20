//
//  Feed.h
//  Feedler
//
//  Created by VJ on 5/20/15.
//  Copyright (c) 2015 VJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Feed : NSManagedObject

@property (nonatomic, retain) NSString * feedTitle;
@property (nonatomic, retain) NSString * feedDesc;
@property (nonatomic, retain) NSString * feedGuid;
@property (nonatomic, retain) NSString * feedLink;
@property (nonatomic, retain) NSString * feedDate;

@end
