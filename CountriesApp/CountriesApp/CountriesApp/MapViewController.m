//
//  MapViewController.m
//  CountriesApp
//
//  Created by PiTechnologies on 5/9/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize DisLat,DisLon;
@synthesize mapView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CLLocationDegrees Lat = DisLat,Lon = DisLon;
    
    CLLocationCoordinate2D Target = CLLocationCoordinate2DMake(Lat, Lon);
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(Target, 800, 800);
    
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = Target;
    //point.title = @"Where am I?";
    //point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
     
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
