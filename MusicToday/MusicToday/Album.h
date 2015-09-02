//
//  Album.h
//  MusicToday
//
//  Created by Jiaxiang Li on 15/9/1.
//  Copyright © 2015年 Jiaxiang Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Album : NSObject


@property(nonatomic) NSString *title;
@property(nonatomic) UIImage *icon;
@property(nonatomic) UIImage *largeIcon;
@property(nonatomic) NSString *price;
@property(nonatomic) NSString *category;
@property(nonatomic) NSString *rights;
@property (nonatomic) NSString *releaseDate;

-(instancetype) initWithIndex:(NSInteger)index fromEntry:(NSArray *) entry;



@end
