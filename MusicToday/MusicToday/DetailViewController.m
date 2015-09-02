//
//  DetailViewController.m
//  MusicToday
//
//  Created by Jiaxiang Li on 15/8/17.
//  Copyright (c) 2015年 Jiaxiang Li. All rights reserved.
//

#import "DetailViewController.h"
#import "Album.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Album *album=[self.myAlbumsArray objectAtIndex:(NSUInteger)self.index];
    self.detailImage.image=album.largeIcon;
    self.titleLabel.text=album.title;
    self.rightsLabel.text=album.rights;
    self.DateLabel.text=album.releaseDate;
    self.priceLabel.text=album.price;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
