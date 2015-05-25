//
//  SettingViewController.m
//  CountriesApp
//
//  Created by PiTechnologies on 5/13/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

-(IBAction)Clear:(id)sender
{
    DBManager* manager = [DBManager new];
    manager = [manager initWithDatabaseFilename:@"countriesAppDB.sql"];
    //////
    NSString* DeleteCitiesQuery = @"DELETE FROM Cities";
    NSString* DeleteCountriesQuery = @"DELETE FROM Countries";
    
    [manager executeQuery:DeleteCitiesQuery];
    [manager executeQuery:DeleteCountriesQuery];
}

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
