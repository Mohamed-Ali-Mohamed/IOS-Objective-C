//
//  HRDept.h
//  Employees
//
//  Created by PiTechnologies on 3/17/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

@interface HRDept : NSObject

@property (readonly) NSMutableArray *Employees;

-(void)Fire : (int)ID;
-(void)Add :(Employee*)Employee;

@end
