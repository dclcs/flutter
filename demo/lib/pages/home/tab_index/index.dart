import 'package:demo/pages/home/tab_index/index_navigator.dart';
import 'package:demo/widgets/common_swipper.dart';
import 'package:flutter/material.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tabIndx"),
      ),
      body: ListView(
        children: <Widget>[
          CommonSwipper(),
          IndexNavigator(),
          Text("这里是内容区域"),
        ],
      ),
    );
  }
}
