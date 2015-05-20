//
//  DataRequestManager.m
//  Feedler
//
//  Created by VJ on 5/20/15.
//  Copyright (c) 2015 VJ. All rights reserved.
//

#import "DataRequestManager.h"
#import <objc/runtime.h>

@interface NSDictionary(dictionaryWithObject)

+(NSDictionary *) dictionaryWithPropertiesOfObject:(id) obj;

@end

@implementation DataRequestManager

-(NSMutableArray*)getRSSForURL
{
    NSString *urlStr=@"http://www.businessinsider.in/rss_section_feeds/21807543.cms";
    
    NSURL *url=[[NSURL alloc]initWithString:urlStr];
    
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url];
    
    NSURLResponse *response=nil;
    
    NSError *error=nil;
    
    NSData *connectionData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSDictionary *xmlDictionary=[NSDictionary dictionaryWithXMLData:connectionData];
    //JSON Parsing
//    NSString *someString = [[NSString alloc] initWithData:connectionData encoding:NSUTF8StringEncoding];
//
//    NSError *parseError = nil;
//    
//    NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLString:someString error:&parseError];
//    
    NSDictionary *rss=[xmlDictionary objectForKey:@"channel"];
    

    id items=[rss objectForKey:@"item"];
    
//    return [NSDictionary dictionaryWithPropertiesOfObject:items];

    NSMutableArray *arr=[[NSMutableArray alloc]init];
    
    for (NSObject *object in items)
    {
        NSMutableDictionary *dic=[NSMutableDictionary dictionary];
        
        [dic setValue:[object valueForKey:@"description"] forKey:@"feedDesc"];
        [dic setValue:[object valueForKey:@"guid"] forKey:@"feedGuid"];
        [dic setValue:[object valueForKey:@"link"] forKey:@"feedLink"];
        [dic setValue:[object valueForKey:@"pubDate"] forKey:@"feedDate"];
        [dic setValue:[object valueForKey:@"title"] forKey:@"feedTitle"];

        [arr addObject:dic];
       
    }

    
    return arr;
    
}
@end

@implementation NSDictionary(dictionaryWithObject)

+(NSDictionary *) dictionaryWithPropertiesOfObject:(id)obj
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([obj class], &count);
    
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        [dict setObject:[obj valueForKey:key] forKey:key];
    }
    
    free(properties);
    
    return [NSDictionary dictionaryWithDictionary:dict];
}

@end
