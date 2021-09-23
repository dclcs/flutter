import 'package:demo/pages/home/tab_search/dataList.dart';
import 'package:demo/widgets/common_floating_action_button.dart';
import 'package:demo/widgets/room_list_item_widget.dart';
import 'package:flutter/material.dart';

class RoomManagePage extends StatelessWidget {
  const RoomManagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CommonFloatingActionButton('发布房源', () {
          Navigator.of(context).pushNamed('roomAdd');
        }),
        appBar: AppBar(
          title: Text('房屋管理页'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              text: '已组',
            ),
            Tab(
              text: '空置',
            ),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children:
                  dataList.map((item) => RoomListItemWidget(item)).toList(),
            ),
            ListView(
              children:
                  dataList.map((item) => RoomListItemWidget(item)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
