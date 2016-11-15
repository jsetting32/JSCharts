//
//  JSCViewController.m
//  JSCharts
//
//  Created by John Setting on 11/12/2016.
//  Copyright (c) 2016 John Setting. All rights reserved.
//

#import "JSCViewController.h"
#import "JSCView.h"

#import "JSCDataPoint.h"

#import "CAShapeLayer+JSCAdditions.h"

@interface JSCViewController () <UIScrollViewDelegate, JSCDataSource, JSCDelegate>
@property (weak, nonatomic) IBOutlet JSCView *scrollView;
@property (strong, nonatomic) NSMutableArray <JSCDataPoint *> * dataPoints;
@end

@implementation JSCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_scrollView setJsc_delegate:self];
    [_scrollView setJsc_dataSource:self];
    [_scrollView reloadData];
    
    _dataPoints = [NSMutableArray array];
    for (NSInteger i = 0; i < 20; i++) {
        int r = rand() % 200;
        JSCDataPoint *data = [JSCDataPoint dataPointWithValue:@(r)];
        [_dataPoints addObject:data];
    }
}

- (NSArray <JSCDataPoint *> *)dataPointsForView:(JSCView *)view {
    return self.dataPoints;
}

- (void)JSCView:(JSCView *)view didSelectDataPoint:(JSCDataPoint *)dataPoint {
    NSLog(@"%@ : %s", NSStringFromClass([self class]), __PRETTY_FUNCTION__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
