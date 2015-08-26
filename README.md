# JMChartView

# use
pod 'JMChartView', '~> 1.0.0'

由于工作需要写了一个折线图，主要是通过几个代理函数导入数据就可实现折线图的效果。

下面是简单的使用说明，如需使用，请告知原作者，谢谢！

作者邮箱：chengjiaming@live.com

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
    return @"淋巴细胞百分比";
}

- (NSArray *)chartView_rulingInLineChart:(JMChartView *)chartView
{
    NSArray *array = nil;
    
    return array;
}
