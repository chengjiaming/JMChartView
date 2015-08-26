//
//  JMColor.h
//  JMChartView
//
//  Created by chengjiaming on 15/3/26.
//  Copyright (c) 2015年 chengjiaming. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 主色系
 */
#define JMBlue [UIColor colorWithRed:38 / 255.0 green:173 / 255.0 blue:223 / 255.0 alpha:1]

/**
 * 背景色
 */
#define JMCloudWhite [UIColor colorWithRed:38 / 255.0 green:173 / 255.0 blue:223 / 255.0 alpha:1]


//范围
struct Range {
    CGFloat max;
    CGFloat min;
};
typedef struct Range JMRange;
CG_INLINE JMRange JMRangeMake(CGFloat max, CGFloat min);

CG_INLINE JMRange
JMRangeMake(CGFloat max, CGFloat min){
    JMRange p;
    p.max = max;
    p.min = min;
    return p;
}

static const JMRange JMRangeZero = {0,0};

@interface JMColor : NSObject

@end
