//
//  NSBFunctionViewer+Animations.h
//  NSBKeyframeAnimation
//
//  Created by Nacho Soto on 8/12/12.
//  Copyright (c) 2012 Nacho Soto. All rights reserved.
//


#import "NSBKeyframeAnimation.h"
#import "NSBKeyframeAnimationFunctions.h"

typedef enum
{
    AnimationTypeEaseInQuad = 0,
    AnimationTypeEaseOutQuad,
    AnimationTypeEaseInOutQuad,
    AnimationTypeEaseInCubic,
    AnimationTypeEaseOutCubic,
    AnimationTypeEaseInOutCubic,
    AnimationTypeEaseInQuart,
    AnimationTypeEaseOutQuart,
    AnimationTypeEaseInOutQuart,
    AnimationTypeEaseInQuint,
    AnimationTypeEaseOutQuint,
    AnimationTypeEaseInOutQuint,
    AnimationTypeEaseInSine,
    AnimationTypeEaseOutSine,
    AnimationTypeEaseInOutSine,
    AnimationTypeEaseInExpo,
    AnimationTypeEaseOutExpo,
    AnimationTypeEaseInOutExpo,
    AnimationTypeEaseInCirc,
    AnimationTypeEaseOutCirc,
    AnimationTypeEaseInOutCirc,
    AnimationTypeEaseInElastic,
    AnimationTypeEaseOutElastic,
    AnimationTypeEaseInOutElastic,
    AnimationTypeEaseInBack,
    AnimationTypeEaseOutBack,
    AnimationTypeEaseInOutBack,
    AnimationTypeEaseInBounce,
    AnimationTypeEaseOutBounce,
    AnimationTypeEaseInOutBounce,
    AnimationTypeAll,
    AnimationTypeCount
} NSBAnimationType;

@interface NSBKeyframeAnimation (Animations)

+ (NSString *)animatonNameForType:(NSBAnimationType)animationType;
+ (NSBKeyframeAnimationFunction)animationFunctionForType:(NSBAnimationType)animationType;

@end
