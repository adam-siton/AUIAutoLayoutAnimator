//
// Created by Adam on 7/9/13.
//

#import "NSBKeyframeAnimation+AUIExtensions.h"

#define kFPS 60

@implementation NSBKeyframeAnimation (AUIExtensions)

+(NSArray *) calculatePositionValuesForFunction:(NSBAnimationType)animationType startValue:(CGFloat)startValue endValue:(CGFloat)endValue withDuration:(CGFloat)duration
{
    NSBKeyframeAnimationFunction function = [NSBKeyframeAnimation animationFunctionForType:animationType];

    NSUInteger steps = (NSUInteger)ceil(kFPS * duration) + 2;

    NSMutableArray *valueArray = [NSMutableArray arrayWithCapacity:steps];

    const double increment = 1.0 / (double)(steps - 1);

    double progress = 0.0,
            v = 0.0,
            value = 0.0;

    NSUInteger i;
    for (i = 0; i < steps; i++)
    {
        v = function(duration * progress * 1000, 0, 1, duration * 1000);
        value = startValue + v * (endValue - startValue);

        [valueArray addObject:[NSNumber numberWithDouble:value]];

        progress += increment;
    }

    return [NSArray arrayWithArray:valueArray];
}

+(int) numberOfStepsForDuration:(CGFloat)duration
{
    return (NSUInteger)ceil(kFPS * duration) + 2;
}

@end