//
//  ViewController.m
//  MusicToday
//
//  Created by Jiaxiang Li on 15/8/17.
//  Copyright (c) 2015年 Jiaxiang Li. All rights reserved.
//

#import "ViewController.h"
#import "ListViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"goToListView"])
    {
        
        
        UIImageView *imageView=(UIImageView *)[sender view];
        
        if ([self.categoryImages containsObject:imageView]) {
            
            NSInteger index=(NSInteger)[self.categoryImages indexOfObject:imageView];
            
            NSLog(@"%li",(long)index);
            ListViewController *listView=(ListViewController *)[segue destinationViewController];
            listView.categoryIndex=index;
            
            NSString *url=@"https://itunes.apple.com/us/rss/topalbums/limit=50/json";
            
            [listView initConnectionWithUrl:url];
        }
    }
}






- (IBAction)goToListView:(id)sender {
    [self performSegueWithIdentifier:@"goToListView" sender:sender];
    
    NSLog(@"click here!");
}

@end
