//
//  CAShapeLayer+JSCAdditions.h
//  JSCharts
//
//  Created by John Setting on 11/12/16.
//  Copyright © 2016 John Setting. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

extern NSString * _Nullable const CABasicAnimationKeyPathAnimation;

@interface CAShapeLayer (JSCAdditions)

+ (nonnull instancetype)barPathWithStartRect:(CGRect)startRect endRect:(CGRect)endRect color:(nullable UIColor *)color;
+ (nonnull instancetype)barPathWithStartRect:(CGRect)startRect endRect:(CGRect)endRect color:(nullable UIColor *)color timingFunction:(nullable CAMediaTimingFunction *)timingFunction animationDuration:(CGFloat)animationDuration;
@end
