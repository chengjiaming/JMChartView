//
//  JMChartView.h
//  JMChartView
//
//  Created by chengjiaming on 15/3/26.
//  Copyright (c) 2015年 chengjiaming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMChartView.h"
#import "JMColor.h"

//图标类型
typedef enum {
    
    JMLineChartViewStyle = 1 << 1,
    JMBarChartViewStyle = 1 << 2,
    
}JMChartViewStyle;

@class JMChartView;
@protocol JMChartViewDataSource <NSObject>

@required
/**
 * 横坐标标题数组
 */
- (NSArray *)chartView_xLabelArray:(JMChartView *)chartView;

/**
 * 数值数组
 */
- (NSArray *)chartView_yValueArray:(JMChartView *)chartView;

/**
 * 显示数值范围
 */
- (JMRange)chartViewChooseRangeInLineChart:(JMChartView *)chartView;

/**
 * 标记数值范围
 */
- (JMRange)chartViewMarkRangeInLineChart:(JMChartView *)chartView;

/**
 * 数值单位
 */
- (NSString *)chartViewUnitInLineChart:(JMChartView *)chartView;

/**
 * 刻度数组
 */
- (NSArray *)chartView_rulingInLineChart:(JMChartView *)chartView;

/**
 * 具体指标项
 */
- (NSString *)chartViewNameInLineChart:(JMChartView *)chartView;

@end

@interface JMChartView : UIView

@property (assign, nonatomic) JMChartViewStyle chartStyle;

- (id)initWithJMChartDataFrame:(CGRect)rect withSource:(id<JMChartViewDataSource>)dataSource withStyle:(JMChartViewStyle)chartViewStyle;

- (void)strokeChart;

@end
