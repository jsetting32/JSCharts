//
//  JSCView.h
//  JSCharts
//
//  Created by John Setting on 11/12/16.
//  Copyright © 2016 John Setting. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JSCDataSource;
@protocol JSCDelegate;

@class JSCDataPoint;

@interface JSCView : UIScrollView
@property (weak, nonatomic, nullable) id <JSCDataSource> jsc_dataSource;
@property (weak, nonatomic, nullable) id <JSCDelegate> jsc_delegate;
- (void)reloadData;
@end

@protocol JSCDataSource <NSObject>
- (NSArray <JSCDataPoint *> *)dataPointsForView:(JSCView *)view;
@end

@protocol JSCDelegate <NSObject>
- (void)JSCView:(nullable JSCView *)view didSelectDataPoint:(nullable JSCDataPoint *)dataPoint;
@end
