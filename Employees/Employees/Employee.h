//
//  Employee.h
//  Employees
//
//  Created by PiTechnologies on 3/17/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property int ID;
@property NSString *Name;
@property double Salary;

-(double) Tax;
-(double) FinalSalary;

@end
