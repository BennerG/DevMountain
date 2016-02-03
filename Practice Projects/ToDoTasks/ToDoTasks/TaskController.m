//
//  TaskController.m
//  ToDoTasks
//
//  Created by Benjamin Thomas Gurrola on 10/20/15.
//  Copyright © 2015 Benjamin Thomas Gurrola. All rights reserved.
//

#import "TaskController.h"

@interface TaskController ()

@property (strong,nonatomic) NSMutableArray *tasks;

@end

@implementation TaskController

+ (TaskController *)sharedInstance {
    static TaskController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [TaskController new];
        sharedInstance.tasks = [NSMutableArray new];
    });
    return sharedInstance;
}


- (void)addTask:(Task *)task {
    [self.tasks addObject:task];
}

- (void)removeTask:(Task *)task {
    [self.tasks removeObject:task];
}

- (void)setUpMockData {
    
    Task *sampleTask1 = [Task new];
    sampleTask1.name = @"Take out garbage";
    sampleTask1.isComplete = NO;

    Task *sampleTask2 = [Task new];
    sampleTask2.name = @"Send check for rent";
    sampleTask2.isComplete = NO;

    Task *sampleTask3 = [Task new];
    sampleTask3.name = @"Call Mom";
    sampleTask3.isComplete = NO;
    
    [self.tasks addObjectsFromArray:@[sampleTask1,sampleTask2,sampleTask3]];
}

@end
