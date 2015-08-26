//
//  JMLineChartView.h
//  JMChartView
//
//  Created by chengjiaming on 15/3/26.
//  Copyright (c) 2015年 chengjiaming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMColor.h"

#define chartMargin     10.0
#define xLabelMargin    15.0
#define yLabelMargin    15.0
#define JMLabelHeight    10.0         //X轴数值Label高度
#define JMYLabelWidth     30.0         //Y轴坐标Label宽度
#define JMXLabelWidth      80.0       //X轴坐标Label宽度
#define JMTagLabelWidth     80.0

@interface JMLineChartView : UIView

@property (strong, nonatomic) NSArray *xLabelArray;  //横坐标标题数组
@property (strong, nonatomic) NSArray *yValueArray;   //数值数组

@property (assign, nonatomic) JMRange markRange;  //显示范围
@property (assign, nonatomic) JMRange chooseRange; //标记范围

@property (strong, nonatomic) NSArray *rulingArray;  //刻度数组

@property (copy, nonatomic) NSString *unit;     //数值单位
@property (copy, nonatomic) NSString *name;     //具体指标项名称

- (void)strokeChart;

@end
