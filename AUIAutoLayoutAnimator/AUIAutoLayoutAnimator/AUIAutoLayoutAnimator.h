//
// Created by Adam on 10/17/13.
//


#import <Foundation/Foundation.h>
#import "NSBKeyframeAnimation+Animations.h"

@interface AUIAutoLayoutAnimator : NSObject

- (id)initWithView:(UIImageView *)view heightConstraint:(NSLayoutConstraint *)heightConstraint widthConstraint:(NSLayoutConstraint *)widthConstraint;

- (void)scaleViewToScale:(float)scale withAnimationFunction:(NSBAnimationType)function andDuration:(float)duration;

- (void) stopAnimation;
@end