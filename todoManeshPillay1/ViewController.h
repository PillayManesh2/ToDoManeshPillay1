//
//  AppDelegate.h
//  todoManeshPillay1
//
//  Created by Student 09 on 01/02/19.
//  Copyright © 2019 ManeshPillay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Databaselib.h"
#import "taskViewController.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

- (IBAction)newToTask:(id)sender;
@property NSArray *myArray;

@end

