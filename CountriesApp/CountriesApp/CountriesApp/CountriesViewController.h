//
//  CountriesViewController.h
//  CountriesApp
//
//  Created by PiTechnologies on 5/9/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryInfoViewController.h"
#import "DBManager.h"
#import "SettingViewController.h"

@interface CountriesViewController : UITableViewController

@property NSMutableArray* Countries,*CountriesData;
@property NSArray* countriesRows;
-(void)getCountries;

-(IBAction)Setting:(id)sender;
@end
