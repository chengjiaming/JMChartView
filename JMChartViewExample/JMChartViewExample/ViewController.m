//
//  ViewController.m
//  JMChartViewExample
//
//  Created by chengjiaming on 15/8/26.
//  Copyright (c) 2015年 chengjiaming. All rights reserved.
//

#import "ViewController.h"
#import "JMChartView.h"
#import "JMColor.h"

@interface ViewController () <JMChartViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JMChartView *chartView = [[JMChartView alloc] initWithJMChartDataFrame:CGRectMake(0, 100, self.view.bounds.size.width, 200) withSource:self withStyle:JMLineChartViewStyle];
    [self.view addSubview:chartView];
    [chartView strokeChart];
    
}

- (NSString *)chartViewUnitInLineChart:(JMChartView *)chartView
{
    return @"%";
}

- (NSArray *)chartView_xLabelArray:(JMChartView *)chartView
{
    NSArray *array = [NSArray arrayWithObjects:@"20140203", @"20140305", @"20140809", @"20140903", @"23133232", @"34735984", @"20153229", nil];
    
    return array;
}

- (NSArray *)chartView_yValueArray:(JMChartView *)chartView
{
    NSArray *array = [NSArray arrayWithObjects:@"30.9", @"47", @"78.7", @"48", @"87", @"34", @"76", nil];
    
    return array;
}

- (JMRange)chartViewChooseRangeInLineChart:(JMChartView *)chartView
{
    
    return JMRangeMake(100, 0);
}

- (JMRange)chartViewMarkRangeInLineChart:(JMChartView *)chartView
{
    
    return JMRangeMake(80, 30);
}

- (NSString *)chartViewNameInLineChart:(JMChartView *)chartView
{
    NSString *sadf = @"淋巴细胞百分比";
    return sadf;
}

- (NSArray *)chartView_rulingInLineChart:(JMChartView *)chartView
{
    NSArray *array = nil;
    
    return array;
}


@end
