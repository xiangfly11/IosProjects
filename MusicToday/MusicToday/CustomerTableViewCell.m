//
//  CustomerTableViewCell.m
//  MyApp
//
//  Created by Jiaxiang Li on 15/8/15.
//  Copyright (c) 2015年 Jiaxiang Li. All rights reserved.
//

#import "CustomerTableViewCell.h"

@implementation CustomerTableViewCell

@synthesize imageView=_imageView;
@synthesize nameLabel=_nameLabel;
@synthesize categoryLabel=_categoryLabel;
@synthesize priceLabel=_priceLabel;




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
