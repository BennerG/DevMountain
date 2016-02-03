//
//  TaskListTableViewController.m
//  ToDoTasks
//
//  Created by Benjamin Thomas Gurrola on 10/20/15.
//  Copyright © 2015 Benjamin Thomas Gurrola. All rights reserved.
//

#import "TaskListTableViewController.h"
#import "TaskController.h"
#import "Task.h"
#import "RightButtonTableViewCell.h"

@interface TaskListTableViewController () <RightButtonTableViewCellDelegate>

@end

@implementation TaskListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [[TaskController sharedInstance] setUpMockData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Right Button Cell Delegate

- (void)buttonWasTapped:(id)sender {
    
    NSIndexPath *selectedCell = [self.tableView indexPathForCell:sender];
    
    Task *tappedTask = [TaskController sharedInstance].tasks[selectedCell.row];
    
    tappedTask.isComplete = !tappedTask.isComplete;
    
    [self.tableView reloadRowsAtIndexPaths:@[selectedCell] withRowAnimation:UITableViewRowAnimationNone];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [TaskController sharedInstance].tasks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RightButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell" forIndexPath:indexPath];
    cell.delegate = self;
    
    Task *task = [TaskController sharedInstance].tasks[indexPath.row];

    [cell updateWithTask:task];
    
    return cell;
}

- (IBAction)addTaskButtonTapped:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Add Task" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Task Name";
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *addTaskAction = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UITextField *textField = alertController.textFields.firstObject;
        
        Task *newTask = [Task new];
        newTask.name = textField.text;
        newTask.isComplete = NO;
        
        [[TaskController sharedInstance] addTask:newTask];
        
        [self.tableView reloadData];
    }];
    
    
    [alertController addAction:addTaskAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Task *deletedTask = [TaskController sharedInstance].tasks[indexPath.row];
        
        [[TaskController sharedInstance]removeTask:deletedTask];
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
