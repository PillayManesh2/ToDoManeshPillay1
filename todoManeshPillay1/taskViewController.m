//
//  AppDelegate.h
//  todoManeshPillay1
//
//  Created by Student 09 on 01/02/19.
//  Copyright © 2019 ManeshPillay. All rights reserved.
//

#import "taskViewController.h"

@interface taskViewController ()

@end

@implementation taskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)saveButton:(id)sender {
    NSString *idText,*nameText;
    idText=self.taskIdtext.text;
    nameText=self.taskNameText.text;
    NSString *query=[NSString stringWithFormat:@"insert into taskTable(Task_id ,Task_name)values(\"%@\",\"%@\")",idText,nameText ];
    int isSuccess=[[Databaselib getSharedObj]executeQuery:query];
    if(isSuccess)
    {
        NSLog(@"Insertion Successfully");
        ViewController *v=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:v animated:YES];
        
    }
    else
    {
        NSLog(@"Insertion Failed");
    }
}

- (IBAction)cancelButton:(id)sender {
    self.taskIdtext.text=@" ";
    self.taskNameText.text=@" ";
}
@end
