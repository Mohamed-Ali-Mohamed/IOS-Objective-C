//
//  DBManager.h
//  CountriesApp
//
//  Created by PiTechnologies on 5/11/15.
//  Copyright (c) 2015 PiTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject

@property (nonatomic, strong) NSString *documentsDirectory;
@property (nonatomic, strong) NSString *databaseFilename;
@property (nonatomic, strong) NSMutableArray *arrResults;
@property (nonatomic, strong) NSMutableArray *arrColumnNames;
@property (nonatomic) int affectedRows;
@property (nonatomic) long long lastInsertedRowID;


-(instancetype)initWithDatabaseFilename:(NSString *)dbFilename;
-(void)copyDatabaseIntoDocumentsDirectory;
-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable;
-(void)executeQuery:(NSString *)query;
-(void)fillCountriesTable:(NSMutableArray*)data;
-(void)fillCitiesTable:(NSMutableArray*)data;
-(NSArray *)loadDataFromDB:(NSString *)query;
@end
