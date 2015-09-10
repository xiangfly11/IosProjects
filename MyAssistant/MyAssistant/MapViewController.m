//
//  MapViewController.m
//  MyAssistant
//
//  Created by Jiaxiang Li on 15/8/23.
//  Copyright (c) 2015年 Jiaxiang Li. All rights reserved.
//

#import "MapViewController.h"
#import "SWRevealViewController.h"
@interface MapViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>

@property (nonatomic,strong) CLLocationManager *locationManager;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    
    if (revealViewController) {
        [self.slideMenuButton setTarget:self.revealViewController];
        
        [self.slideMenuButton setAction:@selector(revealToggle:)];
        
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.delegate = self;
    
    [self.locationManager requestAlwaysAuthorization];
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.mapView setDelegate:self];
    
    self.mapView.mapType = MKMapTypeHybrid;
    
    self.mapView.showsUserLocation = YES;
     
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



-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    CLLocation *location = [locations firstObject];
    
    CLGeocoder *myCoder = [[CLGeocoder alloc] init];
    
    [myCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        
        //CLPlacemark *myPlaceMark = [placemarks firstObject];
        
        
    }];
    
}


-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    MKCoordinateRegion mapRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    
    
    [self.mapView setRegion:[self.mapView regionThatFits:mapRegion] animated:YES];
}

@end
