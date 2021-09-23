import 'package:demo/pages/home/info/index.dart';
import 'package:demo/pages/home/tab_profile/function_button.dart';
import "package:flutter/material.dart";

import 'advertisement.dart';
import 'header.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('我的'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed('setting');
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Header(),
          FunctionButton(),
          Advertisement(),
          Info(
            showTitle: true,
          ),
          Text('content display '),
        ],
      ),
    );
  }
}
