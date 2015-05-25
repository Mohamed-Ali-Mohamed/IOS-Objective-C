//
//  MapViewController.h
//  CountriesApp
//
//  Created by PiTechnologies on 5/9/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

@property double DisLat,DisLon;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@end
