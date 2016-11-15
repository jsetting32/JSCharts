//
//  UIColor+JSCAdditions.m
//  JSCharts
//
//  Created by John Setting on 11/13/16.
//  Copyright © 2016 John Setting. All rights reserved.
//

#import "UIColor+JSCAdditions.h"

@implementation UIColor (JSCAdditions)
+ (UIColor *)randomColor {
    CGFloat red = (arc4random() % 256 / 256.0);
    CGFloat blue = (arc4random() % 256 / 256.0);
    CGFloat green = (arc4random() % 256 / 256.0);
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
    return color;
}
@end
