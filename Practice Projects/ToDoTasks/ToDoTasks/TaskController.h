//
//  TaskController.h
//  ToDoTasks
//
//  Created by Benjamin Thomas Gurrola on 10/20/15.
//  Copyright © 2015 Benjamin Thomas Gurrola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface TaskController : NSObject

@property (strong,nonatomic,readonly) NSMutableArray *tasks;

+ (TaskController *)sharedInstance;

- (void)addTask:(Task *)task;
- (void)removeTask:(Task *)task;
- (void)setUpMockData;

@end
