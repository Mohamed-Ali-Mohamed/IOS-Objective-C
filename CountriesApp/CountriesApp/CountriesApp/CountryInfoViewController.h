//
//  CountryInfoViewController.h
//  CountriesApp
//
//  Created by PiTechnologies on 5/9/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"
#import "DBManager.h"

@interface CountryInfoViewController : UIViewController

@property NSMutableArray* Cities,*CitiesData;
@property NSString* ID;

@property NSArray* citiesRows;
@property NSString* CountryName,*CapitalName,*Paragraph,*ImageURL,*Lat,*Lon;
-(IBAction)ShowMap:(id)sender;
@property IBOutlet UILabel* Capital;
@property IBOutlet UIImageView* Image;
@property IBOutlet UITextView* Info;
@property IBOutlet UILabel* Distance;
@property double CurrentLat,CurrentLon,DisLat,DisLon;

-(void)getCities:NSString;
@end
