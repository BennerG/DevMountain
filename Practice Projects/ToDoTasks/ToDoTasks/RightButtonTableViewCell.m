//
//  RightButtonTableViewCell.m
//  ToDoTasks
//
//  Created by Benjamin Thomas Gurrola on 10/20/15.
//  Copyright © 2015 Benjamin Thomas Gurrola. All rights reserved.
//

#import "RightButtonTableViewCell.h"
#import "TaskController.h"


@interface RightButtonTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *primaryLabel;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end

@implementation RightButtonTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)rightButtonTapped:(id)sender {
    [self.delegate buttonWasTapped:self];
}

- (void)updateWithTask:(Task *)task {
    self.primaryLabel.text = task.name;
    if (task.isComplete) {
        self.rightButton.imageView.image = [UIImage imageNamed:@"complete"];
    } else {
        self.rightButton.imageView.image = [UIImage imageNamed:@"incomplete"];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
