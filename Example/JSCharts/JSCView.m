//
//  JSCView.m
//  JSCharts
//
//  Created by John Setting on 11/12/16.
//  Copyright © 2016 John Setting. All rights reserved.
//

#import "JSCView.h"
#import "JSCDataPoint.h"

#import "CAShapeLayer+JSCAdditions.h"
#import "UIColor+JSCAdditions.h"

@implementation JSCView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    NSArray <JSCDataPoint *> * dataPoints = [self.jsc_dataSource dataPointsForView:self];
    [self setContentSize:CGSizeMake(10 * [dataPoints count], rect.size.height)];
    
    for (int i = 0; i < [dataPoints count]; i++) {
        JSCDataPoint *dataPoint = [dataPoints objectAtIndex:i];
        CGFloat normalized = [dataPoint normalizeDataPointWithDataPoints:dataPoints rect:rect];
        CGRect startRect = CGRectMake(0 + (10 * i), rect.size.height, 10, 0);
        CGRect endRect = CGRectMake(0 + (10 * i), rect.size.height - normalized, 10, normalized);
        
        CAShapeLayer *bar = [CAShapeLayer barPathWithStartRect:startRect endRect:endRect color:[UIColor randomColor]];
        [self.layer addSublayer:bar];
    }
}

- (void)reloadData {
    [self drawRect:self.bounds];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];

    for (CAShapeLayer *layer in [[self layer] sublayers]) {
        if (![layer isKindOfClass:[CAShapeLayer class]]) continue;
        if (CGPathContainsPoint(layer.path, nil, point, false)) {
            NSLog(@"Hit Layer");
            break;
        }
    }
}

@end
