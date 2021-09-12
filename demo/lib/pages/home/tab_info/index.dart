import 'package:demo/pages/home/info/index.dart';
import 'package:demo/widgets/search_bar/index.dart';
import 'package:flutter/material.dart';

class TabInfo extends StatefulWidget {
  const TabInfo({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
          ),
          Info(),
          Info(),
          Info(),
        ],
      ),
    );
  }
}
