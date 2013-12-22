//
// Created by Adam on 10/17/13.
//


#import "AUIAutoLayoutAnimator.h"
#import "NSBKeyframeAnimation+Animations.h"
#import "NSBKeyframeAnimation+AUIExtensions.h"

@interface AUIAutoLayoutAnimator ()
@property(nonatomic, strong) UIImageView *view;
@property(nonatomic, strong) NSLayoutConstraint *heightConstraint;
@property(nonatomic, strong) NSLayoutConstraint *widthConstraint;
@property(nonatomic, strong) NSTimer *timer;
@property (nonatomic) int numberOfSteps;
@property (nonatomic, strong) NSArray *heightValues;
@property (nonatomic, strong) NSArray *widthValues;
@property (nonatomic) NSUInteger currentStep;

@end

@implementation AUIAutoLayoutAnimator {

}

- (id)initWithView:(UIImageView *)view heightConstraint:(NSLayoutConstraint *)heightConstraint widthConstraint:(NSLayoutConstraint *)widthConstraint {
    self = [super init];
    if (self) {
        self.view = view;
        self.heightConstraint = heightConstraint;
        self.widthConstraint = widthConstraint;
    }
    return self;
}

- (void)scaleViewToScale:(float)scale withAnimationFunction:(NSBAnimationType)function andDuration:(float)duration {
    self.heightValues = [NSBKeyframeAnimation calculatePositionValuesForFunction:function startValue:self.heightConstraint.constant endValue:self.heightConstraint.constant*scale withDuration:duration];
    self.widthValues = [NSBKeyframeAnimation calculatePositionValuesForFunction:function startValue:self.widthConstraint.constant endValue:self.widthConstraint.constant*scale withDuration:duration];
    self.numberOfSteps = [NSBKeyframeAnimation numberOfStepsForDuration:1.0];
    self.currentStep = 0;
    float stepDuration = (duration / self.numberOfSteps);
    // Change the timer interval for speed regulation.
    self.timer = [NSTimer scheduledTimerWithTimeInterval:stepDuration target:self selector:@selector(animateView:) userInfo:nil repeats:YES];
}

-(void)stopAnimation {
    [self.timer invalidate];
    self.timer = nil;
}

-(void) animateView:(NSTimer *)timer
{
    if (self.currentStep == self.numberOfSteps) {
        self.heightConstraint.constant = [[self.heightValues lastObject] floatValue];
        self.widthConstraint.constant = [[self.widthValues lastObject] floatValue];
        [self.view layoutIfNeeded];

        [timer invalidate];
        self.timer = nil;
    }
    else {
        self.heightConstraint.constant = [self.heightValues[self.currentStep] floatValue];
        self.widthConstraint.constant = [self.widthValues[self.currentStep] floatValue];
        self.currentStep++;
        [self.view layoutIfNeeded];
    }
}

@end