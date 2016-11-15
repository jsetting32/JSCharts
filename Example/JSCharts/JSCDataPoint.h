//
//  JSCDataPoint.h
//  JSCharts
//
//  Created by John Setting on 11/12/16.
//  Copyright © 2016 John Setting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSCDataPoint : NSObject
+ (instancetype)dataPointWithValue:(NSNumber *)value;
@property (strong, nonatomic) NSNumber *value;
+ (CGFloat)maxValue:(NSArray<JSCDataPoint *> *)dataPoints;
- (CGFloat)normalizeDataPointWithDataPoints:(NSArray<JSCDataPoint *> *)dataPoints rect:(CGRect)rect;
@end
