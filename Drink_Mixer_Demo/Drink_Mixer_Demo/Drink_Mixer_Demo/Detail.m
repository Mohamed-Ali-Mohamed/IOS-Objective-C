//
//  Detail.m
//  Drink_Mixer_Demo
//
//  Created by PiTechnologies on 4/5/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import "Detail.h"

@interface Detail ()

@end

@implementation Detail


@synthesize Output;
@synthesize FinalOutput;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    FinalOutput.text = Output;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
