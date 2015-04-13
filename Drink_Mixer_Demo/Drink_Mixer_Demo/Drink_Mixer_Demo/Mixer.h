//
//  Mixer.h
//  Drink_Mixer_Demo
//
//  Created by PiTechnologies on 4/5/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Detail.h"

@interface Mixer : UIViewController

@property NSMutableArray* Fruits;
@property NSString* Fruit1, *Fruit2,* Fruit3;
-(IBAction)Detail:(id)sender;
@end
