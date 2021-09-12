import 'package:demo/routers.dart';
import 'package:flutter/material.dart';

// 编写无状态组件

class PageContent extends StatelessWidget {
  final String name;

  const PageContent({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('当前页面: $name'),
      ),
      body: ListView(children: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.home);
            },
            child: Text(Routes.home)),
        FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.login);
            },
            child: Text(Routes.login)),
        FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/room/2222');
            },
            child: Text('房屋详情: id : 2222')),
        FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/aaaaa');
            },
            child: Text('不存在的页面')),
      ]),
    );
  }
}
