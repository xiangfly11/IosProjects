//
//  NotesEntry.h
//  MyAssistant
//
//  Created by Jiaxiang Li on 15/8/28.
//  Copyright (c) 2015年 Jiaxiang Li. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NotesEntry : NSManagedObject

@property (nonatomic,retain) NSString *body;

@property (nonatomic) NSTimeInterval date;

@property (nonatomic,retain) NSString *location;

@property (nonatomic,retain) NSString *title;


@property (nonatomic,readonly) NSString *sectionName;

//@property (nonatomic) NSTimeInterval now;

@end
