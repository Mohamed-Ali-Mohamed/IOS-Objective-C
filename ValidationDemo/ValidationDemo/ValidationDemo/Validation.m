//
//  Validation.m
//  ValidationDemo
//
//  Created by PiTechnologies on 4/3/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import "Validation.h"

@interface Validation ()

@end

@implementation Validation

@synthesize Input;
@synthesize Output;

-(IBAction)StringValidation:(id)sender
{
    NSString* UserInput = Input.text;
    bool valid=true;
    
    for(int i=0 ; i<UserInput.length ; i++)
    {
        char ch = [UserInput characterAtIndex:i];
        
        if(ch>='0' && ch<='9')
        {
            valid=false;
            break;
        }
        
    }
    
    
    if(UserInput.length==0)
    {
        Output.text = @"";
    }
    else if(valid==true)
    {
        Output.text = @"valid text";
    }
    else
    {
        Output.text = @"ERROR";
    }
}


-(IBAction)NumberValidation:(id)sender
{
    NSString* UserInput = Input.text;
    bool valid=true;
    
    for(int i=0 ; i<UserInput.length ; i++)
    {
        char ch = [UserInput characterAtIndex:i];
        
        if(ch>='0' && ch<='9')
        {
            ;
        }
        else
        {
            valid=false;
            break;
        }
        
    }
    if(UserInput.length==0)
    {
        Output.text = @"";
    }
    else if(valid==true)
    {
        Output.text = @"valid text";
    }
    else
    {
        Output.text = @"ERROR";
    }
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
