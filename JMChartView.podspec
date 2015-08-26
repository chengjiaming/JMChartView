Pod::Spec.new do |s|
s.name                   = "JMChartView"
s.version                = "1.0.5"
s.ios.deployment_target  = "7.0"
s.summary                = "TA marquee view used on iOS."
s.homepage               = "https://github.com/chengjiaming/JMChartView"
s.license                = "MIT"
s.author                 = {"chengjiaming" => "1072670694@qq.com"}
s.source                 = {:git => "https://github.com/chengjiaming/JMChartView.git", :tag => s.version}
s.requires_arc           = true
s.source_files           = "JMChartView/*"
s.resources              = 'JMChartView/Images/*'
end
