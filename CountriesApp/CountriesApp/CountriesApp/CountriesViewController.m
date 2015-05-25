//
//  CountriesViewController.m
//  CountriesApp
//
//  Created by PiTechnologies on 5/9/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import "CountriesViewController.h"

@interface CountriesViewController ()

@end

@implementation CountriesViewController

@synthesize Countries;
@synthesize countriesRows;

-(IBAction)Setting:(id)sender
{
    SettingViewController *SettingVC = [SettingViewController new];
    SettingVC.title = @"Setting";
    
    
    [self.navigationController pushViewController:SettingVC animated:true];
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        [self LoadData];
    }

    return self;
}

-(void) LoadData
{
    // Custom initialization
    Countries = [NSMutableArray new];
    
    DBManager* manager = [DBManager new];
    
    manager = [manager initWithDatabaseFilename:@"countriesAppDB.sql"];
    
    NSString* selectCountriesQuery = @"SELECT *FROM Countries";
    countriesRows = [NSArray new];
    countriesRows = [manager loadDataFromDB:selectCountriesQuery];
    
    // check if database is empty
    if(countriesRows.count == 0 )
    {
        // url
        [self getCountries];
        
        countriesRows = [manager loadDataFromDB:selectCountriesQuery];
    }
    /*
    if(citiesRows.count == 0)
    {
        // url
        for(int i=0 ; i<countriesRows.count ; i++)
        {
            NSString *URL =@"http://demo.pitechnologies.net/ITO_IOS/city.php?city_id=";
            URL = [URL stringByAppendingString:[[countriesRows objectAtIndex:i] objectAtIndex:0]];
            [handler2 getCities:URL];
            
        }
        citiesRows = [manager2 loadDataFromDB:selectCitiesQuery];
    }*/
    
    
    // use  countriesRows to fill the table of countries
    for(int i=0 ; i<countriesRows.count ; i++)
    {
        [Countries addObject:[[countriesRows objectAtIndex:i] objectAtIndex:1]];
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [Countries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [Countries objectAtIndex:indexPath.row];

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    CountryInfoViewController *CountryInfoVC = [CountryInfoViewController new];
    CountryInfoVC.title = [Countries objectAtIndex:indexPath.row];
    
    // Pass the selected object to the new view controller.
    for(int i=0 ; i<countriesRows.count ; i++)
    {
        if( CountryInfoVC.title == [[countriesRows objectAtIndex:i] objectAtIndex:1])
        {
            NSString* ID = [[countriesRows objectAtIndex:i]objectAtIndex:0];
            CountryInfoVC.ID = ID;
            CountryInfoVC.Lat = [[countriesRows objectAtIndex:i] objectAtIndex:2];
            CountryInfoVC.Lon = [[countriesRows objectAtIndex:i] objectAtIndex:3];
            break;
        }
        
    }
    
    // Push the view controller.
    [self.navigationController pushViewController:CountryInfoVC animated:true];
}
 
#pragma Countries Web Service

- (void)getCountries
{
    self.CountriesData = [NSMutableArray new];
    NSURL* countriesWSURL =
    [NSURL URLWithString:@"http://demo.pitechnologies.net/ITO_IOS/getcountries.php"];
    
    NSURLRequest *countriesWSRequest = [NSURLRequest requestWithURL:countriesWSURL];
    
    NSURLConnection *myConnection =
    [NSURLConnection connectionWithRequest:countriesWSRequest delegate:self];
    
    [myConnection start];
    NSLog(@"I in getcountries");
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
    self.CountriesData = [NSJSONSerialization JSONObjectWithData:data
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
    [manager fillCountriesTable:self.CountriesData];
    
    [self LoadData];
    [self.tableView reloadData];
}


@end
