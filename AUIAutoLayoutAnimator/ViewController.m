//
//  ViewController.m
//  AUIAutoLayoutAnimator
//
//  Created by Adam on 12/22/13.
//  Copyright (c) 2013 adamsiton. All rights reserved.
//

#import "ViewController.h"
#import "AUIAutoLayoutAnimator.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *appleImage;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *imageHeightConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *imageWidthConstraint;

@property (nonatomic, strong) AUIAutoLayoutAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.animator = [[AUIAutoLayoutAnimator alloc] initWithView:self.appleImage heightConstraint:self.imageHeightConstraint widthConstraint:self.imageWidthConstraint];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonClicked:(id)sender
{
    [self.animator scaleViewToScale:1.4 withAnimationFunction:AnimationTypeEaseOutQuart andDuration:1.5];
}

@end
