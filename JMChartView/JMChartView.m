//
//  JMChartView.m
//  JMChartView
//
//  Created by chengjiaming on 15/3/26.
//  Copyright (c) 2015年 chengjiaming. All rights reserved.
//

#import "JMChartView.h"
#import "JMLineChartView.h"

@interface JMChartView ()

@property (nonatomic, strong) JMLineChartView *lineChartView;
@property (nonatomic, strong) id<JMChartViewDataSource> dataSource;

@end

@implementation JMChartView

- (id)initWithJMChartDataFrame:(CGRect)rect withSource:(id<JMChartViewDataSource>)dataSource withStyle:(JMChartViewStyle)chartViewStyle
{
    self.dataSource = dataSource;
    self.chartStyle = chartViewStyle;
    
    return [self initWithFrame:rect];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)strokeChart
{
    [self setUpChart];
}

- (void)setUpChart
{
    switch (self.chartStyle) {
        case JMLineChartViewStyle:       //折线图
        {
            if (!_lineChartView) {
                
                _lineChartView = [[JMLineChartView alloc] initWithFrame:self.bounds];
                [self addSubview:_lineChartView];
            }
            
            //数值数组
            if ([self.dataSource respondsToSelector:@selector(chartView_yValueArray:)]) {
                [_lineChartView setYValueArray:[self.dataSource chartView_yValueArray:self]];
            }
            
            //数值单位
            if ([self.dataSource respondsToSelector:@selector(chartViewUnitInLineChart:)]) {
                [_lineChartView setUnit:[self.dataSource chartViewUnitInLineChart:self]];
            }

            
            //选择显示范围
            if ([self.dataSource respondsToSelector:@selector(chartViewChooseRangeInLineChart:)]) {
                [_lineChartView setChooseRange:[self.dataSource chartViewChooseRangeInLineChart:self]];
            }
            
            //选择标记范围
            if ([self.dataSource respondsToSelector:@selector(chartViewMarkRangeInLineChart:)]) {
                [_lineChartView setMarkRange:[self.dataSource chartViewMarkRangeInLineChart:self]];
            }
            
            //刻度数组
            if ([self.dataSource respondsToSelector:@selector(chartView_rulingInLineChart:)]) {
                [_lineChartView setRulingArray:[self.dataSource chartView_rulingInLineChart:self]];
            }
            
            //x轴标题数组
            if ([self.dataSource respondsToSelector:@selector(chartView_xLabelArray:)]) {
                [_lineChartView setXLabelArray:[self.dataSource chartView_xLabelArray:self]];
            }
            
            //具体指标项
            if ([self.dataSource respondsToSelector:@selector(chartViewNameInLineChart:)]) {
                
                [_lineChartView setName:[self.dataSource chartViewNameInLineChart:self]];
            }
            
            [_lineChartView strokeChart];
        }
            break;
            
        case JMBarChartViewStyle:
        {
            //柱状图待扩展
        }
            
        default:
            break;
    }
}

@end
