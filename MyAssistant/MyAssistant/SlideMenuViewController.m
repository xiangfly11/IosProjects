//
//  SlideMenuViewController.m
//  MyAssistant
//
//  Created by Jiaxiang Li on 15/8/31.
//  Copyright © 2015年 Jiaxiang Li. All rights reserved.
//

#import "SlideMenuViewController.h"
#import "SlideMenuCell.h"
#import "SWRevealViewController.h"
#import "SlideMenuItems.h"
#import <UIKit/UIKit.h>

@interface SlideMenuViewController ()

@end

@implementation SlideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"aaaaa");
    
    [self.tableView setDataSource:self];
    
    [self.tableView setDelegate:self];
    _menuItems = [[SlideMenuItems alloc] init];
    
    
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



#pragma mark - TableViewDataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"===");
    return 1;
    
}



-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _menuItems.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"cell";
    
    NSLog(@"%@",identifier);
    
    SlideMenuCell *cell = (SlideMenuCell *)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.titleLabel.text = [self.menuItems.items objectAtIndex:indexPath.row];
    
    cell.imageIcon.image = [UIImage imageNamed:[self.menuItems.items objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger index = (NSInteger) indexPath.row;
    
    NSLog(@"%ld",index);
    
    switch (index) {
        case 1:
            [self performSegueWithIdentifier:@"news" sender:self];
            break;
        case 2:
            [self performSegueWithIdentifier:@"forcast" sender:self];
            break;
        case 3:
            [self performSegueWithIdentifier:@"map" sender:self];
            break;
        case 4:
            [self performSegueWithIdentifier:@"notes" sender:self];
            break;
        default:
            break;
    }
}


@end
