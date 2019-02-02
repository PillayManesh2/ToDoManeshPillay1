//
//  AppDelegate.h
//  todoManeshPillay1
//
//  Created by Student 09 on 01/02/19.
//  Copyright © 2019 ManeshPillay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface Databaselib : NSObject
{
    sqlite3 *taskDatabase;
}
+(instancetype)getSharedObj;
-(NSString *)getDatabasePath;
-(void)createDatabase;
-(int)executeQuery:(NSString *)query;
-(NSArray *)getAllTasks:(NSString *)query;
//@property NSArray *taskarray;
@end
