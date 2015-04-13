//
//  Employee.m
//  Employees
//
//  Created by PiTechnologies on 3/17/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import "Employee.h"

@implementation Employee

@synthesize ID;
@synthesize Name;
@synthesize Salary;

-(double)Tax
{
    return Salary*.2;
}

-(double) FinalSalary
{
    return Salary - [self Tax];
}

@end
