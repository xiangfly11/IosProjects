//
//  MapViewController.h
//  MyAssistant
//
//  Created by Jiaxiang Li on 15/8/23.
//  Copyright (c) 2015年 Jiaxiang Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *slideMenuButton;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
