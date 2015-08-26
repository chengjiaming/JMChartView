//
//  JMLineChartView.m
//  JMChartView
//
//  Created by chengjiaming on 15/3/26.
//  Copyright (c) 2015年 chengjiaming. All rights reserved.
//

#import "JMLineChartView.h"
#import "JMChartLabel.h"
#import "JMLineOfDashes_H.h"
#import "JMLineOfDashes_V.h"

@interface JMLineChartView ()

@property (nonatomic, assign) CGFloat xLabelSpacing;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation JMLineChartView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:246 / 255.0 green:251 / 255.0 blue:253 / 255.0 alpha:1];
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return self;
}

- (void)setYValueArray:(NSArray *)yValueArray
{
    _yValueArray = yValueArray;
    
    if([_yValueArray count] > 5){
        
        _xLabelSpacing = 50.0;
    }else if ([_yValueArray count] == 5) {
    
        _xLabelSpacing = 60.0;
    }else if ([_yValueArray count] == 4) {
        
        _xLabelSpacing = 80.0;
    }else if([_yValueArray count] == 3) {
        
        _xLabelSpacing = 120.0;
    }else {
        
        _xLabelSpacing = 200.0;
    }
}

- (void)setMarkRange:(JMRange)markRange
{
    _markRange = markRange;
    if (_markRange.min == _markRange.max) {
        return;
    }
    
    /**
     * 画取值范围view，以及画取值范围label
     */
    CGFloat chartCavanHeight = self.frame.size.height - JMLabelHeight * 4;
    CGFloat topY = (_chooseRange.max - _markRange.max) / (_chooseRange.max - _chooseRange.min) * chartCavanHeight  + 2.5 * JMLabelHeight;
    CGFloat bottomY = (_chooseRange.max - _markRange.min) / (_chooseRange.max - _chooseRange.min) * chartCavanHeight  + 2.5 * JMLabelHeight;
    CGFloat centerY = (topY + bottomY) / 2;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, topY, self.frame.size.width, bottomY - topY)];
    view.backgroundColor = [UIColor colorWithRed:223 / 255.0 green:227 / 255.0 blue:214 / 255.0 alpha:1];
    [self addSubview:view];
    
    //画虚线
    JMLineOfDashes_V *lineOfDashes = [[JMLineOfDashes_V alloc] initWithFrame:CGRectMake(0, topY, self.frame.size.width, 0.5)];
    lineOfDashes.backgroundColor = [UIColor clearColor];
    [self addSubview:lineOfDashes];
    
    lineOfDashes = [[JMLineOfDashes_V alloc] initWithFrame:CGRectMake(0, bottomY, self.frame.size.width, 0.5)];
    lineOfDashes.backgroundColor = [UIColor clearColor];
    [self addSubview:lineOfDashes];

    JMChartLabel *label = nil;
    NSString *labelStr = nil;
    
    //最大范围值
    if ([_unit isEqualToString:@"%"]) {
        
        labelStr = [NSString stringWithFormat:@"%g%@", markRange.max, @"%"];
    }else {
        labelStr = [NSString stringWithFormat:@"%g", markRange.max];
    }
    label = [[JMChartLabel alloc] initWithFrame:CGRectMake(0, topY - JMLabelHeight, JMYLabelWidth, JMLabelHeight)];
    label.text = labelStr;
    [self addSubview:label];
    
    //正常
    label = [[JMChartLabel alloc] initWithFrame:CGRectMake(0, centerY - JMLabelHeight, JMYLabelWidth, JMLabelHeight)];
    label.text = @"正常";
    [self addSubview:label];
    
    //最小范围值
    if ([_unit isEqualToString:@"%"]) {
        
        labelStr = [NSString stringWithFormat:@"%g%@", markRange.min, @"%"];
    }else {
        labelStr = [NSString stringWithFormat:@"%g", markRange.min];
    }
    label = [[JMChartLabel alloc] initWithFrame:CGRectMake(0, bottomY - JMLabelHeight, JMYLabelWidth, JMLabelHeight)];
    label.text = labelStr;
    [self addSubview:label];
    
    //正常范围label
    labelStr = [NSString stringWithFormat:@"%g-%g为正常", markRange.min, markRange.max];
    if ([_unit isEqualToString:@"%"]) {
        
        labelStr = [NSString stringWithFormat:@"%g%@-%g%@为正常", markRange.min, @"%", markRange.max, @"%"];
    }
    label = [[JMChartLabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 115, 0, 100, 2.5 * JMLabelHeight)];
    label.text = labelStr;
    label.textAlignment = NSTextAlignmentRight;
    label.textColor = [UIColor blackColor];
    [self addSubview:label];
}

- (void)setChooseRange:(JMRange)chooseRange
{
    _chooseRange = chooseRange;
    
    /**
     * 画y轴上下边界label,以及
     */
    
    CGFloat topY = JMLabelHeight * 2.5;
    CGFloat bottonY = self.frame.size.height - JMLabelHeight * 2.5;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, topY, self.frame.size.width, self.frame.size.height - 4 * JMLabelHeight)];
    view.backgroundColor = [UIColor colorWithRed:229 / 255.0 green:236 / 255.0 blue:236 / 255.0 alpha:1];
    [self addSubview:view];
    
    NSString *labelStr = [NSString stringWithFormat:@"%g", _chooseRange.min];
    if (![_unit isEqualToString:@"%"]) {
        
        JMChartLabel *label = [[JMChartLabel alloc] initWithFrame:CGRectMake(0, topY + 5, JMYLabelWidth, JMLabelHeight)];
        label.text = _unit;
        [self addSubview:label];
    }else {
        
        labelStr = [NSString stringWithFormat:@"%g%@", _chooseRange.min, @"%"];
    }
    
    JMChartLabel *label = [[JMChartLabel alloc] initWithFrame:CGRectMake(0, bottonY, JMYLabelWidth, JMLabelHeight)];
    label.text = labelStr;
    [self addSubview:label];
    
}

- (void)setXLabelArray:(NSArray *)xLabelArray
{
    _xLabelArray = xLabelArray;
    
    /**
     * 画x轴坐标系
     */
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - JMLabelHeight * 1.5, self.frame.size.width, JMLabelHeight * 1.5)];
    view.backgroundColor = [UIColor colorWithRed:67 / 255.0 green:184 / 255.0 blue:201 / 255.0 alpha:1];
    [self addSubview:view];
    
    [self addSubview:_scrollView];
    
    for (int i = 0; i < [_xLabelArray count]; i++) {
        
        //画日期
        NSString *labelText = [_xLabelArray objectAtIndex:i];
        JMChartLabel *label = [[JMChartLabel alloc] initWithFrame:CGRectMake(JMYLabelWidth + 20 + i * _xLabelSpacing - JMXLabelWidth / 2, self.frame.size.height - JMLabelHeight * 1.5, JMXLabelWidth, JMLabelHeight * 1.5)];
        label.text = labelText;
        label.textColor = [UIColor whiteColor];
        [self.scrollView addSubview:label];
        
        //画虚线
        JMLineOfDashes_H *lineOfDashes = [[JMLineOfDashes_H alloc] initWithFrame:CGRectMake(JMYLabelWidth + 20 + i * _xLabelSpacing, 2.5 * JMLabelHeight, 0.5, _scrollView.frame.size.height - 4 * JMLabelHeight)];
        lineOfDashes.backgroundColor = [UIColor clearColor];
        [self.scrollView addSubview:lineOfDashes];
    }
    
    if (_xLabelSpacing * [_xLabelArray count] + JMYLabelWidth + 10 > self.frame.size.width) {
        
        _scrollView.contentSize = CGSizeMake(_xLabelSpacing * [_xLabelArray count] + JMYLabelWidth + 10, self.frame.size.height);
    }
    
    //画虚线
    JMLineOfDashes_V *lineOfDashes = [[JMLineOfDashes_V alloc] initWithFrame:CGRectMake(0, self.frame.size.height - JMLabelHeight * 1.5 - 1, self.frame.size.width, 0.5)];
    lineOfDashes.backgroundColor = [UIColor clearColor];
    [self addSubview:lineOfDashes];
    
    //时间
    JMChartLabel *label = [[JMChartLabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - JMLabelHeight * 1.5, 26, JMLabelHeight * 1.5)];
    label.text = @"时间";
    label.backgroundColor = [UIColor colorWithRed:67 / 255.0 green:184 / 255.0 blue:201 / 255.0 alpha:1];
    label.textColor = [UIColor whiteColor];
    [self addSubview:label];
}

- (void)setName:(NSString *)name
{
    _name = name;
    
    //设置标题名称
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, self.frame.size.width - 140, JMLabelHeight * 2.5)];
    label.text = name;
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor colorWithRed:78 / 255.0 green:178 / 255.0 blue:198 / 255.0 alpha:1];
    [self addSubview:label];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kkol_informe_detail_indicator"]];
    imageView.frame = CGRectMake(18, 0, 12, 12);
    imageView.center = CGPointMake(20, label.center.y);
    [self addSubview:imageView];
}

- (void)setRulingArray:(NSArray *)rulingArray
{
    _rulingArray = rulingArray;
    
    /**
     * 木有取值范围，绘制刻度
     */
    CGFloat chartCavanHeight = self.frame.size.height - JMLabelHeight * 4;
    
    JMChartLabel *label = nil;
    NSString *labelStr = nil;
    
    for (int i = 0; i < [_rulingArray count]; i++) {
        
        CGFloat value = [[_rulingArray objectAtIndex:i] floatValue];
        
        CGFloat yPosition = (_chooseRange.max - value) / (_chooseRange.max - _chooseRange.min) * chartCavanHeight  + 1.5 * JMLabelHeight;
        
        if ([_unit isEqualToString:@"%"]) {
            
            labelStr = [NSString stringWithFormat:@"%g%@", value, @"%"];
        }else {
            labelStr = [NSString stringWithFormat:@"%g", value];
        }
        label = [[JMChartLabel alloc] initWithFrame:CGRectMake(0, yPosition, JMYLabelWidth, JMLabelHeight)];
        label.text = labelStr;
        [self addSubview:label];
        
        yPosition = (_chooseRange.max - value) / (_chooseRange.max - _chooseRange.min) * chartCavanHeight;
        //画虚线
        JMLineOfDashes_V *lineOfDashes = [[JMLineOfDashes_V alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.5)];
        lineOfDashes.backgroundColor = [UIColor clearColor];
        [self addSubview:lineOfDashes];
    }
    
}

#pragma mark - 绘制折线图
- (void)strokeChart
{
    if ([_yValueArray count] == 0) {
        
        return;
    }
    
    //第一个点
    UIBezierPath *progressLine = [UIBezierPath bezierPath];
    CGFloat firstValue = [[_yValueArray objectAtIndex:0] floatValue];
    CGFloat chartCavanHeight = self.frame.size.height - JMLabelHeight * 4;
    CGFloat xPosition = JMYLabelWidth + 20;
    CGFloat yPosition = (_chooseRange.max - firstValue) / (_chooseRange.max - _chooseRange.min) * chartCavanHeight  + 2.5 * JMLabelHeight;
    CGPoint firstPoint = CGPointMake(xPosition, yPosition);  //第一个点的坐标
    
    [self addPoint:firstPoint value:firstValue];   //画第一个点
    
    [progressLine moveToPoint:firstPoint];         //准备划线起始坐标
    [progressLine setLineWidth:1.5];               //线的宽度
    [progressLine setLineCapStyle:kCGLineCapRound];
    [progressLine setLineJoinStyle:kCGLineJoinRound];
    
    //非第一个点
    for (int i = 1; i < [_yValueArray count]; i++) {
        
        CGFloat value = [[_yValueArray objectAtIndex:i] floatValue];
        xPosition = JMYLabelWidth + 20 + i * _xLabelSpacing;
        yPosition = (_chooseRange.max - value) / (_chooseRange.max - _chooseRange.min) * chartCavanHeight  + 2.5 * JMLabelHeight;
        CGPoint point = CGPointMake(xPosition, yPosition);
        [progressLine addLineToPoint:point];       //链接下一个节点
        [self addPoint:point value:value];         //画下一个节点
        
        [progressLine stroke];
    }
    
    UIBezierPath *linePath = [progressLine copy];
    
    //画区域
    [progressLine addLineToPoint:CGPointMake(([_yValueArray count] - 1)* _xLabelSpacing + JMYLabelWidth + 20, self.frame.size.height - 1.5 * JMLabelHeight)];
    [progressLine addLineToPoint:CGPointMake(JMYLabelWidth + 20, self.frame.size.height - 1.5 * JMLabelHeight)];
    CAShapeLayer *chartLineView = [[CAShapeLayer alloc] init];
    chartLineView.lineCap = kCALineCapRound;
    chartLineView.lineJoin = kCALineJoinBevel;
    chartLineView.fillColor = [UIColor colorWithRed:78 / 255.0 green:178 / 255.0 blue:198 / 255.0 alpha:0.2].CGColor;
    chartLineView.path = progressLine.CGPath;
    chartLineView.strokeColor = [UIColor clearColor].CGColor;
    [self.scrollView.layer addSublayer:chartLineView];
    
    //划线
    CAShapeLayer *chartLine = [CAShapeLayer layer];
    chartLine.lineCap = kCALineCapRound;
    chartLine.lineJoin = kCALineJoinBevel;
    chartLine.fillColor = [UIColor clearColor].CGColor;
    chartLine.lineWidth = 0.7;
    chartLine.strokeEnd = 0.0;
    chartLine.path = linePath.CGPath;
    chartLine.strokeColor = [UIColor colorWithRed:78 / 255.0 green:178 / 255.0 blue:198 / 255.0 alpha:1].CGColor;
    chartLine.strokeEnd = 1.0;
    [_scrollView.layer addSublayer:chartLine];

}

#pragma mark - 绘制节点
- (void)addPoint:(CGPoint)point value:(CGFloat)value
{
    UIColor *textColor = nil;
    if ((value < _markRange.min || value > _markRange.max) && _markRange.max != _markRange.min) {
        
        textColor = [UIColor colorWithRed:207 / 255.0 green:59 / 255.0 blue:149 / 255.0 alpha:1];
    }else {
        
        textColor = [UIColor colorWithRed:78 / 255.0 green:178 / 255.0 blue:198 / 255.0 alpha:1];
    }
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 6, 6)];
    view.center = point;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 3;
    view.layer.borderWidth = 1.2;
    view.backgroundColor = textColor;
    view.layer.borderColor = [UIColor whiteColor].CGColor;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(point.x - JMTagLabelWidth / 2.0, point.y - JMLabelHeight * 1.8, JMTagLabelWidth, JMLabelHeight)];
    label.font = [UIFont systemFontOfSize:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = textColor;
    if ([_unit isEqualToString:@"%"]) {     //如若单位是%，则数值上加上%
        
        label.text = [NSString stringWithFormat:@"%g%@", value, @"%"];
    }else
    {
        label.text = [NSString stringWithFormat:@"%g", value];
    }
    
    [self.scrollView addSubview:label];   //加点
    [self.scrollView addSubview:view];    //加点上的数值
}

@end
