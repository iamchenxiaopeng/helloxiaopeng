## echarts概述

1，echarts官网：
https://echarts.apache.org/zh/index.html

2，echarts示例

https://echarts.apache.org/examples/zh/index.html

## echarts基本使用

想要简单使用echarts，只需要用以下操作就行：

1，引入echarts

方法一、
<script src="echarts.min.js"></script>

方法二、
npm install echarts -S
然后在mian.js里面引入echarts：import * as echarts from 'echarts'
然后定义全局变量：Vue.prototype.$echarts = echarts

2，为echarts准备一个容器dom，基于准备好的dom，初始化echarts实例

<div id="main" style="width: 600px;height:400px;"></div>

var myChart = echarts.init(document.getElementById('main'));


3，指定图表的配置项和数据


var option = {
            title: {
                text: 'ECharts 入门示例'
            },
            tooltip: {},
            legend: {
                data:['销量']
            },
            xAxis: {
                data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: [5, 20, 36, 10, 10, 20]
            }]
        };

4，使用刚指定的配置项和数据显示图表

myChart.setOption(option);


## echarts重要配置项

echarts里面最重要的就是option配置项，配置项非常复杂，包含标题(title)，图例(legend)，直角坐标系(grid)，直角坐标系(x、y)轴，series等等配置。

### 配置项-title
该配置项表示标题
left,top,text等等常用参数

### 配置项-legend
该配置项表示图例
data：图例数据
icon: 图例形状，官方有默认的，也可以使用自定义图片
type: 图例种类

### 配置项-grid
该配置项表示直角坐标系内绘图网格

containLabel：是否含有刻度标签

### 配置项-xAxis
直角坐标系 grid 中的 x 轴

### 配置项-yAxis
直角坐标系 grid 中的 y 轴

yAxis里面是一个数组，数组里面每一个数据都表示一个的图形。
展示不同的图形用数据的type表示。
数据里面有一个stack参数，该参数可以让同一个stack的显示在同一个图形中。

### 配置项-series

柱子的颜色渐变：
itemStyle: {
    borderRadius: 20, // 圆角
    color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{

        offset: 0,
        color: '#4F9CF3'
    }, {
        offset: 1,
        color: '#1DBD7B'
    }]) // 颜色渐变，起-始
}

柱状图的堆叠：
根据每一个series里面的item的stack属性，属性一样的堆叠到一根柱状图上

### formatter用法

formatter有自己的字符串模板，模板变量为：{a}, {b}，{c}，{d}，{e}，分别表示系列名，数据名，数据值等。

如果需要自定义数据，写法通常为(这个通常用在label里面)：
 formatter: function (params) {
     console.log(params)
     return: "参数：" + params.data
 }

 ## 其他使用

 ### 标记不同区域不同展示颜色

 markArea + legend

 ### label的显示位置

如果普通的position: left这样的参数满足不了要求，可以用['50%','50%']这种方式。