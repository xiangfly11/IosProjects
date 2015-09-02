//
//  Album.m
//  MusicToday
//
//  Created by Jiaxiang Li on 15/9/1.
//  Copyright © 2015年 Jiaxiang Li. All rights reserved.
//

#import "Album.h"

@implementation Album

-(instancetype) initWithIndex:(NSInteger)index fromEntry:(NSArray *) entry
{
    self=[super init];
    if (self) {
        NSDictionary *entryDictionary=[NSDictionary dictionaryWithDictionary:entry[index]];
        
        NSDictionary *priceDictionary=[entryDictionary objectForKey:@"im:price"];
        
        self.price=[priceDictionary objectForKey:@"label"];
        
        NSDictionary *titleDictionary=[entryDictionary objectForKey:@"im:name"];
        
        self.title=[titleDictionary objectForKey:@"label"];
        
        NSArray *imageArray=[entryDictionary objectForKey:@"im:image"];
        
        NSDictionary *iconDictionary=imageArray[0];
        
        NSString *iconString=[iconDictionary objectForKey:@"label"];
        
        self.icon=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:iconString]]];
        
        NSDictionary *largeIconDictionary=imageArray[2];
        
        NSString *largeIconString=[largeIconDictionary objectForKey:@"label"];
        
        self.largeIcon=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:largeIconString]]];
        
        
        NSDictionary *cateoryDictionary=[entryDictionary objectForKey:@"category"];
        
        NSDictionary *attributesDictionary=[cateoryDictionary objectForKey:@"attributes"];
        
        self.category=[attributesDictionary objectForKey:@"label"];
        
        
        NSDictionary *rightsDictionary=[entryDictionary objectForKey:@"rights"];
        self.rights=[rightsDictionary objectForKey:@"label"];
        
        
        NSDictionary *releaseDictionary=[entryDictionary objectForKey:@"im:releaseDate"];
        
        NSDictionary *releaseAttribute=[releaseDictionary objectForKey:@"attributes"];
        
        self.releaseDate=[releaseAttribute objectForKey:@"label"];
    }
    return  self;
}

@end
