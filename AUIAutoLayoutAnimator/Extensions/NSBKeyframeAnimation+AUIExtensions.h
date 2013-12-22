//
// Created by Adam on 7/9/13.
//


#import <Foundation/Foundation.h>
#import "NSBKeyframeAnimation.h"
#import "NSBKeyframeAnimation+Animations.h"

@interface NSBKeyframeAnimation (AUIExtensions)

+(NSArray *) calculatePositionValuesForFunction:(NSBAnimationType)animationType startValue:(CGFloat)startValue endValue:(CGFloat)endValue withDuration:(CGFloat)duration;

+(int) numberOfStepsForDuration:(CGFloat)duration;

@end