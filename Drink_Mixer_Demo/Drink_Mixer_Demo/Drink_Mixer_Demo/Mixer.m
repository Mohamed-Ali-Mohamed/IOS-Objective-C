//
//  Mixer.m
//  Drink_Mixer_Demo
//
//  Created by PiTechnologies on 4/5/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import "Mixer.h"

@interface Mixer ()

@end

@implementation Mixer


@synthesize Fruits;
@synthesize Fruit1, Fruit2, Fruit3;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        Fruits = [NSMutableArray new];
        [Fruits addObject:@"Apple"];
        [Fruits addObject:@"Banana"];
        [Fruits addObject:@"Orange"];
        [Fruits addObject:@"Date"];
        [Fruits addObject:@"Mango"];
        [Fruits addObject:@"Cherry"];
        
    }
    return self;
}

-(int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    //remove first fruit
    if(Fruit1!=nil && [Fruits containsObject:Fruit1]==true)
        [Fruits removeObject:Fruit1];
    return [Fruits count];
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(pickerView.tag == 0)
        Fruit2 = [Fruits objectAtIndex:row];
    else
        Fruit3 = [Fruits objectAtIndex:row];
    return [Fruits objectAtIndex:row];
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

-(IBAction)Detail:(id)sender
{
    
    Detail *DetailVC = [Detail new];
    
    NSString* Output = Fruit1;
    
    Output = [Output stringByAppendingString:Fruit2];
    Output = [Output stringByAppendingString:Fruit3];
    
    DetailVC.Output = Output;
    
    DetailVC.title = @"Detail";
    
    
    
    [self.navigationController pushViewController:DetailVC animated:true];
}
@end
