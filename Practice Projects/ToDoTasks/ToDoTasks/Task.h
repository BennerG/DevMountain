//
//  Task.h
//  ToDoTasks
//
//  Created by Benjamin Thomas Gurrola on 10/20/15.
//  Copyright © 2015 Benjamin Thomas Gurrola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (strong,nonatomic) NSString *name;
@property (assign,nonatomic) bool isComplete;

@end
