//
//  EntryBuilder.h
//  MyAssistant
//
//  Created by Jiaxiang Li on 15/8/28.
//  Copyright (c) 2015年 Jiaxiang Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsEntryBuilder : NSObject

+(NSArray *) entriesFromJson:(NSData *) objectData error:(NSError **) error;
@end
