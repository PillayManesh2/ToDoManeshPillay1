//
//  AppDelegate.h
//  todoManeshPillay1
//
//  Created by Student 09 on 01/02/19.
//  Copyright © 2019 ManeshPillay. All rights reserved.
//

#import "Databaselib.h"

@implementation Databaselib
+(instancetype)getSharedObj
{
    static Databaselib *sharedObject;
    if(sharedObject==nil)
    {
        sharedObject=[[Databaselib alloc]init];
    }
    return sharedObject;
}
-(NSString *)getDatabasePath
{
    NSArray *docDir=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[[docDir firstObject]stringByAppendingString:@"myDatabase.db"];
    return dbpath;
}
-(int)executeQuery:(NSString *)query
{
    int success=0;
    const char *cQuery=[query UTF8String];
    const char *cDatabasePath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDatabasePath, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&stmt,NULL)!=SQLITE_OK)
        {
            NSLog(@"Error:%s",sqlite3_errmsg(taskDatabase));
        }
        else
        {
            
        
            if(sqlite3_step(stmt)==SQLITE_DONE)
            {
                success=1;
            }
        
        }
    }
    return success;
}
-(void)createDatabase
{
    int isSuccess;
    NSString *query=@"create table if not exists taskTable(Task_id Text,Task_name Text)";
    isSuccess=[self executeQuery:query];
    if(isSuccess)
    {
        NSLog(@"Database created successfully");
    }
    else
    {
        NSLog(@"Database creation failed");
    }
}
-(NSArray *)getAllTasks:(NSString *)query
{
    NSMutableArray *taskArray=[[NSMutableArray alloc]init];
    const char *cQuery=[query UTF8String];
    const char *cDatabasePath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDatabasePath, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&stmt,NULL)!=SQLITE_OK)
        {
            NSLog(@"Error:%s",sqlite3_errmsg(taskDatabase));
        }
        else
        {
            
            
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                const char *task=(const char *)sqlite3_column_text(stmt, 1);
                NSString *myTask=[NSString stringWithFormat:@"%s",task];
                [taskArray addObject:myTask];
            }
            
        }
    }
    
    //self.taskarray=[[NSArray alloc]init];
    //self.taskarray=taskArray;
    return taskArray;
    
}
@end
