//
//  ViewController.m
//  GestureAnimation
//
//  Created by Parker Wightman on 10/21/15.
//  Copyright © 2015 DevMtn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *horizontalCenterConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalCenterConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

@property (weak, nonatomic) IBOutlet UIView *orangeView;

@property (assign,nonatomic) BOOL isTransformed;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap)];

    UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didDoubleTap)];
    doubleTapRecognizer.numberOfTapsRequired = 2;

    UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeRight)];
    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeLeft)];
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;

    [tapRecognizer requireGestureRecognizerToFail:doubleTapRecognizer];

    [self.orangeView addGestureRecognizer:tapRecognizer];
    [self.orangeView addGestureRecognizer:doubleTapRecognizer];
    [self.orangeView addGestureRecognizer:swipeRightRecognizer];
    [self.orangeView addGestureRecognizer:swipeLeftRecognizer];
    
    self.isTransformed = NO;
}

- (void)didTap {

    // TODO: Use a "scale" transform animation to grow the orangeView to twice its size.
    [UIView animateWithDuration:1.0 animations:^{
        if (self.isTransformed == YES) {
            self.orangeView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            self.isTransformed = NO;
        } else {
            self.orangeView.transform = CGAffineTransformMakeScale(2.0, 2.0);
            self.isTransformed = YES;
        }
        
    }];
    
    NSLog(@"Tapped!");
}

- (void)didDoubleTap {
    // TODO: Make the orangeView 50% transparent.
    [UIView animateWithDuration:1.0 animations:^{
        self.orangeView.alpha = (self.orangeView.alpha != 1.0) ? 1.0 : 0.5;
    }];
    
    NSLog(@"Double Tapped!");
}

- (void)didSwipeRight {
    // TODO: Move orangeView to the right by the amount of its width. (i.e. If it's 50 points wide, animate it to the right by 50 points)
    self.orangeView.transform = CGAffineTransformMakeTranslation(self.orangeView.frame.size.width/2, 0.0);
    [self.orangeView updateConstraints];
    
    NSLog(@"Swiped Right!");
}

- (void)didSwipeLeft {
    self.orangeView.transform = CGAffineTransformMakeTranslation(-self.orangeView.frame.size.width/2, 0.0);
    [self.orangeView updateConstraints];
    
    NSLog(@"Swiped Left!");
}

// Extra TODO: Do the same for left/down/up swipe

@end
