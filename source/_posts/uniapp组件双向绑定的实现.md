## uniapp组件中双向绑定的错误方式

在vue是一个数据驱动的框架，数据都是讲究由上向下流动的，所以要是直接修改input v-model里面的值，会报错：

Avoid mutating a prop directly since the value will be overwritten whenever the parent component re-renders. Instead, use a data or computed property based on the prop's value. Prop being mutated: "value"

大意就是不允许组件来修改父页面（父组件）的值。

## 实现方式

真正能实现组件双向绑定需要用到一个@input事件，实现思路如下：

首先子组件里面可以用一个input标签，然后input标签双向绑定当前页面的变量，我们暂时把这个变量定为inputVal。
然后子组件数据改变后，需要动态更改inputVal的值，然后再用this.$emit(input,data)直接改变父组件的v-model绑定的子组件的值。


具体代码示例：
（1）父页面
``` xml
<childcom v-model="data.a"></childcom>
```
(2)子页面
``` xml
<template>
	<view @click.stop="trigger">
		<input type="text" v-model="inputVal" :placeholder="placeholder" disabled>
	</view>
	<view @click="tell('helloworld')">
		改变子组件的值同时通知父组件实现双向绑定
	</view>
</template>

<script>
	export default {
		name: COMPONENT_NAME,
		props: {
			
			value: {
				type: String,
				default: ''
			}, // 父页面双向绑定的值
		},
		data() {
			return {
				inputVal: '',
			}
		},
		methods: {
			tell(data) {
				this.inputVal = data
				this.$emit('input', this.inputVal)
			},
		}
	}
</script>

```

