//
//  JSCDataPoint.m
//  JSCharts
//
//  Created by John Setting on 11/12/16.
//  Copyright © 2016 John Setting. All rights reserved.
//

#import "JSCDataPoint.h"

@implementation JSCDataPoint

+ (instancetype)dataPointWithValue:(NSNumber *)value {
    return [[self alloc] initWithValue:value];
}

- (instancetype)initWithValue:(NSNumber *)value {
    if (!(self = [super init])) return nil;
    _value = value;
    return self;
}

+ (CGFloat)maxValue:(NSArray<JSCDataPoint *> *)dataPoints {
    return [[[dataPoints valueForKey:@"value"] valueForKeyPath:@"@max.doubleValue"] doubleValue];
}

- (CGFloat)normalizeDataPointWithDataPoints:(NSArray<JSCDataPoint *> *)dataPoints rect:(CGRect)rect {
    NSNumber *maxValue = [[dataPoints valueForKey:@"value"] valueForKeyPath:@"@max.doubleValue"];
    NSNumber *minValue = [[dataPoints valueForKey:@"value"] valueForKeyPath:@"@min.doubleValue"];
    NSNumber *value = [self value];
    
    CGFloat xi = [value doubleValue];
    CGFloat xmin = [minValue doubleValue];
    CGFloat xmax = [maxValue doubleValue];
    
    CGFloat top = xi - xmin;
    CGFloat bottom = xmax - xmin;

    CGFloat normalized = top / bottom;
    
    return normalized * rect.size.height;
}

/*
+ (CGFloat)normalize:(const CCPoint& v):point {
    return ccpMult(v, 1.0f/ccpLength(v));
}

ccpMult(const CCPoint& v, const float s)
{
    return ccp(v.x*s, v.y*s);
}

CCPoint  ccpNormalize(const CCPoint& v)
{
    return ccp(v.x*1.0f/ccpLength(v),  v.y*1.0f/ccpLength(v));
    
}

float  ccpLength(const CCPoint& v)
{
    return sqrtf(ccpLengthSQ(v));
}

static inline float  ccpLengthSQ(const CCPoint& v)
{
    return ccpDot(v, v);
}

static inline float
ccpDot(const CCPoint& v1, const CCPoint& v2)
{
    return v1.x*v2.x + v1.y*v2.y;
}
*/


@end
