//
//  CountryInfoViewController.m
//  CountriesApp
//
//  Created by PiTechnologies on 5/9/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import "CountryInfoViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface CountryInfoViewController ()

@end

@implementation CountryInfoViewController

@synthesize Cities,ID,citiesRows;

@synthesize Capital,Image,Info,Distance,CapitalName,Paragraph,ImageURL,Lat,Lon;
@synthesize CurrentLat,CurrentLon,DisLat,DisLon;

-(IBAction)ShowMap:(id)sender
{
    MapViewController *MapVC = [MapViewController new];
    MapVC.title = CapitalName;
    
    MapVC.DisLat = DisLat;
    MapVC.DisLon = DisLon;
    
    [self.navigationController pushViewController:MapVC animated:true];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


-(void) LoadData
{
    // Custom initialization
    Cities = [NSMutableArray new];
    
    DBManager* manager = [DBManager new];
    
    manager = [manager initWithDatabaseFilename:@"countriesAppDB.sql"];
    
    NSString* selectCitiesQuery = @"SELECT *FROM Cities WHERE Cityid='";
    selectCitiesQuery = [selectCitiesQuery stringByAppendingString:ID];
    selectCitiesQuery = [selectCitiesQuery stringByAppendingString:@"'"];
    citiesRows = [NSArray new];
    citiesRows = [manager loadDataFromDB:selectCitiesQuery];
    
    
     if(citiesRows.count == 0)
     {
     // url
         
     NSString *URL =@"http://demo.pitechnologies.net/ITO_IOS/city.php?city_id=";
     URL = [URL stringByAppendingString: ID];
     [self getCities:URL];
     
     }
     else
     {
        CapitalName = [[citiesRows objectAtIndex:0] objectAtIndex:1];
        Paragraph = [[citiesRows objectAtIndex:0] objectAtIndex:2];
        ImageURL = [[citiesRows objectAtIndex:0] objectAtIndex:3];
     }

    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self LoadData];
    // Do any additional setup after loading the view from its nib.
    Capital.text = CapitalName;
    Info.text = Paragraph;
    NSData* ImageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
    Image.image = [UIImage imageWithData:ImageData];

    ///////
    //Distance in m
    ///////
    //1)Target Location
    DisLat = [Lat doubleValue];
    DisLon = [Lon doubleValue];
    //2)User Location
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationManager startUpdatingLocation];
    CurrentLat = locationManager.location.coordinate.latitude;
    CurrentLon = locationManager.location.coordinate.longitude;
    //3)Calc Distance
    CLLocation *locA = [[CLLocation alloc] initWithLatitude:CurrentLat longitude:CurrentLon];
    
    CLLocation *locB = [[CLLocation alloc] initWithLatitude:DisLat longitude:DisLon];
    
    CLLocationDistance _distance = [locA distanceFromLocation:locB];
    
    NSString* DistanceInString = [[NSString alloc] initWithFormat:@"%f",_distance];
    //4)Add to textbox
    DistanceInString = [@"Distance " stringByAppendingString:DistanceInString];
    DistanceInString = [DistanceInString stringByAppendingString:@" in meters"];
    Distance.text = DistanceInString;
    /////////
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Cities Web Service

- (void)getCities:(NSString*)Url
{
    self.CitiesData = [NSMutableArray new];
    NSURL* citiesWSURL =
    [NSURL URLWithString:Url];
    
    NSURLRequest *citiesWSRequest = [NSURLRequest requestWithURL:citiesWSURL];
    
    NSURLConnection *myConnection =
    [NSURLConnection connectionWithRequest:citiesWSRequest delegate:self];
    
    [myConnection start];
    NSLog(@"I in getcities");
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse* )response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*) response;
    
    int errorCode = httpResponse.statusCode;
    
    NSString *fileMIMEType = [[httpResponse MIMEType] lowercaseString];
    
    NSLog(@"response is %d, %@", errorCode, fileMIMEType);
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSError *e = nil;
    self.CitiesData = [NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingMutableContainers error:&e];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // inform the user
    
    NSLog(@"Connection failed! Error - %@ %@",
          
          [error localizedDescription],
          
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"I in finishLoading");
    DBManager* manager = [DBManager new];
    manager = [manager initWithDatabaseFilename:@"countriesAppDB.sql"];
    [manager fillCitiesTable:self.CitiesData];
    
    [self LoadData];
    [self viewDidLoad];
}



@end
