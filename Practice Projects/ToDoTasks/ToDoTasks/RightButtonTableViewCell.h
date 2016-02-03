//
//  RightButtonTableViewCell.h
//  ToDoTasks
//
//  Created by Benjamin Thomas Gurrola on 10/20/15.
//  Copyright © 2015 Benjamin Thomas Gurrola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@protocol RightButtonTableViewCellDelegate

- (void)buttonWasTapped:(id)sender;

@end

@interface RightButtonTableViewCell : UITableViewCell

- (void)updateWithTask:(Task *)task;

@property (weak,nonatomic) id<RightButtonTableViewCellDelegate> delegate;

@end


