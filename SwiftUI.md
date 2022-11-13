### SwiftUI

UIKit 使用 

~~~
// UIHostingController
let vc = UIHostingController(rootView: ContentView())
~~~

* [在UIKit中使用SwiftUI(SwiftUI和UIKit混合开发) - 简书](https://www.jianshu.com/p/65dc94908334)
* [在 UIKit 中使用 Swift UI - 腾讯云开发者社区-腾讯云](https://cloud.tencent.com/developer/article/1926204)

~~~
error: Cannot use mutating member on immutable value: 'self' is immutable
我是在做数组append的时候报的错，这个时候说成员不可变，但我的成员是 var 修饰的。
那么解决方案：
如果是在函数中操作， mutating func 修饰一下函数。
对数组或其他成员变量，用 @State 修饰一下。
~~~

* [(2条消息) SwiftUI：Cannot use mutating member on immutable value: ‘self‘ is immutable\_wuwuFQ的博客-CSDN博客](https://blog.csdn.net/wujakf/article/details/122193273)

UITextView

<font color="#660000" size="3">***！！演示 SwiftUI 如何使用 UIKit 控件，在 SwiftUI 现有控件满足不了时需要转用 UIKIt 的时候***</font>


* [封装 UITextView - SwiftUI - 知乎](https://zhuanlan.zhihu.com/p/351501464)
* [SwiftUI中使用UITextView（可分行）和UITextField - 简书](https://www.jianshu.com/p/0ada9cb8e199)

UITextView - placeholder

* [Swift版本UItextView添加placeholder和字数控制 - 简书](https://www.jianshu.com/p/c6d2fab6edc2)


颜色渐变

* [iOS SwiftUI 颜色渐变填充效果 - 知乎](https://zhuanlan.zhihu.com/p/107699391)

button

* [(2条消息) 「SwiftUI」Button常见样式效果\_淡酒交魂的博客-CSDN博客\_swiftui 圆角矩形](https://blog.csdn.net/danjiujiaohun/article/details/125435448)

单选按钮

<font color="#660000" size="3">***！！可思考body触发（Swift的生命周期）***</font>

* [How to Create Radio Button in SwiftUI - StackBus.com](https://stackbus.com/how-to-create-radio-button-in-swiftui/)

背景

* [(2条消息) SwiftUI 代码速查之 06 设置SwiftUI backgroundColor的方法与foregroundColor相同\_知识大胖的博客-CSDN博客](https://blog.csdn.net/iCloudEnd/article/details/116844696)

居中 - 居左 - 居右

* [(2条消息) SwiftUI 如何实现HStack非对称居中\_知识大胖的博客-CSDN博客](https://blog.csdn.net/iCloudEnd/article/details/106418220/)

字体自适应大小 minimumScaleFactor

* [SwiftUI 之 Text - 简书](https://www.jianshu.com/p/fbbb55a22fe8)

SwiftUI传递到UIKit的回调

* [将数据从SwiftUI传递到UIKit的回调 - 我爱学习网](https://www.5axxw.com/questions/content/t3ztnp)

SwiftUI 间距

* [HStack SwiftUI中的前后间距 - 我爱学习网](https://www.5axxw.com/questions/content/p5xwcv)
* [SwiftUI 基础篇之 HStack - 知乎](https://zhuanlan.zhihu.com/p/388332998)

回调 action

~~~
var dismiss: (() -> Void)?
let _ = self.dismiss!
if let someDismiss = self.dismiss {
    someDismiss()
}
~~~

* [处理来自UIKit的SwiftUI视图回调 - 我爱学习网](https://www.5axxw.com/questions/content/vcza0r)
* [将数据从SwiftUI传递到UIKit的回调 - 我爱学习网](https://www.5axxw.com/questions/content/t3ztnp)

* [SwiftUI Preview传递参数问题 - 简书](https://www.jianshu.com/p/bb4543246dc3)

### SwiftUI 问题：

1. 三维图调试不符合预期
2. 需要包装 VC 无法继承
3. 导航对象用不了