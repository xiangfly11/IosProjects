//
//  DirectionViewController.m
//  MyAssistant
//
//  Created by Jiaxiang Li on 9/30/15.
//  Copyright © 2015 Jiaxiang Li. All rights reserved.
//

#import "DirectionViewController.h"
#import <MapKit/MapKit.h>

@interface DirectionViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *myMapView;

@property (nonatomic) CLLocationManager *locationManager;

@end

@implementation DirectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.delegate = self;
    
    [self.locationManager requestAlwaysAuthorization];
    
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.myMapView setDelegate: self];
    
    self.myMapView.mapType = MKMapTypeHybrid;
    
    self.myMapView.showsUserLocation = YES;
    
    [self.locationManager startUpdatingLocation];
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
- (IBAction)cancelAction:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

@end
