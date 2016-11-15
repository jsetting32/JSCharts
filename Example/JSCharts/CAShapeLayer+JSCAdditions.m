//
//  CAShapeLayer+JSCAdditions.m
//  JSCharts
//
//  Created by John Setting on 11/12/16.
//  Copyright © 2016 John Setting. All rights reserved.
//

#import "CAShapeLayer+JSCAdditions.h"

NSString * const CABasicAnimationKeyPathAnimation = @"path";

@implementation CAShapeLayer (JSCAdditions)

+ (nonnull instancetype)barPathWithStartRect:(CGRect)startRect endRect:(CGRect)endRect color:(UIColor *)color {
    return [CAShapeLayer barPathWithStartRect:startRect
                                      endRect:endRect
                                        color:color
                               timingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]
                            animationDuration:1.5f];
}

+ (nonnull instancetype)barPathWithStartRect:(CGRect)startRect endRect:(CGRect)endRect color:(UIColor *)color timingFunction:(CAMediaTimingFunction *)timingFunction animationDuration:(CGFloat)animationDuration {

    if (!color) {
        color = [UIColor blackColor];
    }
    
    if (!timingFunction) {
        timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    }
    
    UIBezierPath *startPath = [UIBezierPath bezierPathWithRect:startRect];
    UIBezierPath *endPath = [UIBezierPath bezierPathWithRect:endRect];
    
    CAShapeLayer *myShapeLayer  = [CAShapeLayer layer];
    myShapeLayer.path           = [endPath CGPath];
    myShapeLayer.fillColor      = [color CGColor];
    
    CABasicAnimation *pathAnimation     = [CABasicAnimation animationWithKeyPath:CABasicAnimationKeyPathAnimation];
    pathAnimation.duration              = animationDuration;
    pathAnimation.fromValue             = (__bridge id _Nullable)(startPath.CGPath);
    pathAnimation.toValue               = (__bridge id _Nullable)(endPath.CGPath);
    pathAnimation.timingFunction        = timingFunction;

    [myShapeLayer addAnimation:pathAnimation forKey:nil];
    
    return myShapeLayer;
}

@end
