//
//  JMChartLabel.m
//  JMChartView
//
//  Created by chengjiaming on 15/3/26.
//  Copyright (c) 2015年 chengjiaming. All rights reserved.
//

#import "JMChartLabel.h"

@implementation JMChartLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        /*
         * 配置属性
         */
        self.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = [UIColor clearColor];
        self.font = [UIFont systemFontOfSize:9.0f];
    }
    return self;
}

@end
