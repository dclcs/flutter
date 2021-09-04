import 'package:flutter/material.dart';

// 编写无状态组件

class PageContent extends StatelessWidget {
  final String name;

  const PageContent({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('当前页面: $name'),
      ),
    );
  }
}
