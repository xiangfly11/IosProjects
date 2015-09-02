//
//  DetailViewController.h
//  MusicToday
//
//  Created by Jiaxiang Li on 15/8/17.
//  Copyright (c) 2015年 Jiaxiang Li. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Album;
@interface DetailViewController : UIViewController

@property (nonatomic) Album *detailAlbum;

@property (nonatomic) NSArray *myAlbumsArray;

@property (nonatomic) NSInteger *index;

@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *rightsLabel;

@property (weak, nonatomic) IBOutlet UILabel *DateLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
