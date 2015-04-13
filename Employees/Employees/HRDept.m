//
//  HRDept.m
//  Employees
//
//  Created by PiTechnologies on 3/17/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import "HRDept.h"

@implementation HRDept

@synthesize Employees;

-(void) Fire:(int)ID
{
    for(int i=0 ; i<Employees.count ; i++)
    {
        if([[Employees objectAtIndex:i] ID] == ID)
            [Employees removeObjectAtIndex:i];
    }
}

-(void)Add:(Employee *)Employee
{
    [Employees addObject:Employee];
}

@end
