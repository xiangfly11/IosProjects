//
//  CustomerTableViewCell.h
//  MyApp
//
//  Created by Jiaxiang Li on 15/8/15.
//  Copyright (c) 2015年 Jiaxiang Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@end
