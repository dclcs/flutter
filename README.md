# flutter
 
### Flutter Basices

- 无状态组件和有状态组件

```Dart
// 无状态组件
class MyText extends StatelessWidget {
  // 组件的参数
  final String text;

  // 组件的构造函数
  MyText(this.text);

  // 组件的实现部分
  Widget build(context) {
    return new Text(
      text,
      style: new TextStyle(fontSize: 40.0),
    );
  }
}

// 有状态组件
class Counter extends StatefulWidget {
  // 组件的参数
  final String title;

  // 组件的参数
  Counter({Key key, this.title}): super(key: key);

  // 没有build方法。但有createState()方法
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 状态
  int counter = 0;
  
  void increaseCount() {
    setState(() {
      this.counter ++;
    }
  }

  // build 方法
  Widget build(context) {
    return new RaisedButton(
      onPressed: increaseCount,
      child: new Text("+1"),
    );
  }
}
```

- Material 组件 和 Cupertino 组件
  - flutter 是开箱即用的
  - Material： Android 风格的组件
  - Cupertino：iOS 风格的组件

- 常用组件
  - Text
  - Image
  - Icon
  - Container： 类似html中的div
  - Row、Colunn： flex布局
  - Stack
  - Scaffold：页面的基本组件，提供基本的页面结构，包括顶部的title及功能，顶部tab、底部tab、导航按钮等