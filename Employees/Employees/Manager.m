//
//  Manager.m
//  Employees
//
//  Created by PiTechnologies on 3/17/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import "Manager.h"

@implementation Manager
static HRDept *hrManager;
-(void)Fire
{
    int ID = self.ID;
    [hrManager Fire:ID];
}

@end
