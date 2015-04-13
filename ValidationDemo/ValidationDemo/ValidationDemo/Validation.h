//
//  Validation.h
//  ValidationDemo
//
//  Created by PiTechnologies on 4/3/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Validation : UIViewController
@property IBOutlet UITextField* Input;
@property IBOutlet UILabel* Output;

-(IBAction)StringValidation:(id)sender;
-(IBAction)NumberValidation:(id)sender;
@end
