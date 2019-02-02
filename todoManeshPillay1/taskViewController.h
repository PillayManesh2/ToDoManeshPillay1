//
//  AppDelegate.h
//  todoManeshPillay1
//
//  Created by Student 09 on 01/02/19.
//  Copyright © 2019 ManeshPillay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Databaselib.h"
#import "ViewController.h"
@interface taskViewController : UIViewController
- (IBAction)saveButton:(id)sender;
- (IBAction)cancelButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *taskIdtext;
@property (weak, nonatomic) IBOutlet UITextField *taskNameText;

//@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

@end
