//
//  NotesEntry.m
//  MyAssistant
//
//  Created by Jiaxiang Li on 15/8/28.
//  Copyright (c) 2015年 Jiaxiang Li. All rights reserved.
//

#import "NotesEntry.h"

@implementation NotesEntry

@dynamic body;
@dynamic date;
@dynamic location;
@dynamic title;
//@dynamic now;

-(NSString *) sectionName {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.date];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    
    [dateFormatter setDateFormat:@"MM dd yyyy"];
    
    
    return [dateFormatter stringFromDate:date];
    
}





@end
