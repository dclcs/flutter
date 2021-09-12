import 'package:demo/pages/home/info/index.dart';
import 'package:demo/pages/home/tab_index/index_navigator.dart';
import 'package:demo/pages/home/tab_index/index_recommond.dart';
import 'package:demo/widgets/common_swipper.dart';
import 'package:demo/widgets/search_bar/index.dart';
import 'package:flutter/material.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          showLocation: true,
          showMap: true,
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
          onSearchSubmit: (value) => {},
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          CommonSwipper(),
          IndexNavigator(),
          IndexRecommond(),
          Info(
            showTitle: true,
          ),
          Text("这里是内容区域"),
        ],
      ),
    );
  }
}
