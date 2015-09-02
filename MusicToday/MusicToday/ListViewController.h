//
//  ListViewController.h
//  MusicToday
//
//  Created by Jiaxiang Li on 15/8/17.
//  Copyright (c) 2015年 Jiaxiang Li. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ListViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,NSURLConnectionDelegate>

@property (nonatomic) NSURL *url;
@property (nonatomic) NSURLRequest *request;
@property (nonatomic) NSURLConnection *connection;
@property (nonatomic) NSMutableArray *myAlbums;
@property (nonatomic) NSMutableArray *myPopAlbums;
@property (nonatomic) NSMutableArray *myClassicAlbums;
@property (nonatomic) NSMutableArray *myCountryAlbums;
@property (nonatomic) NSMutableArray *myRockAlbums;
@property (nonatomic) NSMutableArray *myElectronicAlbums;
@property (nonatomic) NSMutableArray *myOtherAlbums;



-(void) initConnectionWithUrl:(NSString *) url;

@property (nonatomic) NSInteger *categoryIndex;


@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
