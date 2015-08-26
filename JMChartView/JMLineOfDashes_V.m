//
//  JMLineOfDashes_V.m
//  JMChartView
//
//  Created by chengjiaming on 15/3/30.
//  Copyright (c) 2015年 chengjiaming. All rights reserved.
//

#import "JMLineOfDashes_V.h"

@implementation JMLineOfDashes_V

- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 设置起始点
    CGPathMoveToPoint(path, NULL, 0, 0);
    // 设置目标点
    CGPathAddLineToPoint(path, NULL, rect.size.width, 0);
    
    // 将路径添加到上下文
    CGContextAddPath(context, path);
    
    // 设置线条宽度
    CGContextSetLineWidth(context, 0.5);
    // 设置线条的顶点样式
    CGContextSetLineCap(context, kCGLineCapRound);
    // 设置线条的连接点样式
    CGContextSetLineJoin(context, kCGLineJoinRound);
    // 设置线条的虚线样式
    CGFloat lengths[2] = {1, 1};
    CGContextSetLineDash(context, 0.0, lengths, 2);
    
    [[UIColor grayColor] setStroke];
    
    // 绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
    
    // 释放路径
    CGPathRelease(path);
}

@end
