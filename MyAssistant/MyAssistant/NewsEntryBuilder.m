//
//  EntryBuilder.m
//  MyAssistant
//
//  Created by Jiaxiang Li on 15/8/28.
//  Copyright (c) 2015年 Jiaxiang Li. All rights reserved.
//

#import "NewsEntryBuilder.h"
#import "NewsEntry.h"

@implementation NewsEntryBuilder

+(NSArray *) entriesFromJson:(NSData *)objectData error:(NSError **)error {
    
    NSError *localError = nil;
    
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectData options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return  nil;
    }
    
    NSMutableArray *finalEntries = [[NSMutableArray alloc] init];
    
    NSArray *objectArray = [parsedObject objectForKey:@"T1348647853363"];
    
    for (NSDictionary *news in objectArray) {
        NewsEntry *entry = [[NewsEntry alloc] init];
        
        entry.newsTitle = [news objectForKey:@"title"];
        
        entry.newsDate = [news objectForKey:@"ptime"];
        
        NSString *imageString = [news objectForKey:@"imgsrc"];
        
        NSURL *imageUrl = [NSURL URLWithString:imageString];
        
        NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
        
        entry.newsSmallImage = [[UIImage alloc] initWithData:imageData];
        
        [finalEntries addObject:entry];
    }
    
    return finalEntries;
    
    
}




@end
