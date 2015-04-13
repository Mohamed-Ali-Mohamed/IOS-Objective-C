//
//  main.m
//  Employees
//
//  Created by PiTechnologies on 3/17/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Employee.h"
#import "Manager.h"
#import "HRDept.h"

int main(int argc, const char * argv[])
{
    int NumberOfEmployees,ID;
    double Salary;
    
    NSMutableArray *Employees = [NSMutableArray new];
    
    printf("Number of Employees = ");
    scanf("%i",&NumberOfEmployees);
    
    for(int i=0 ; i<NumberOfEmployees ; i++)
    {
        
        Employee *newEmployee = [Employee new];
        
        printf("ID = ");
        scanf("%i",&ID);
        newEmployee.ID = ID;
        
        char ch;int j=0;
        char cstring[256]={0};
        printf("Name = ");
        scanf("%c",&ch);
        do {
            scanf("%c",&ch);
            cstring[j++]=ch;
        }while (ch!='\n' && j<255);
        newEmployee.Name = [NSString stringWithUTF8String:cstring];
        
        printf("Salary = ");
        scanf("%lf",&Salary);
        newEmployee.Salary = Salary;
        
        [Employees addObject:newEmployee];
    }
    
    for(int i=0 ; i<Employees.count ; i++)
    {
        Employee *E = [Employees objectAtIndex:i];
        NSLog(@"ID = %i \nName = %@ \nTax = %lf \nFinal Salary = %lf \n",[E ID],[E Name],[E Tax],[E FinalSalary]);
    }
    
}
