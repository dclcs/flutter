import 'package:demo/pages/home/tab_search/data_list.dart';
import 'package:demo/pages/home/tab_search/filter_bar/index.dart';
import 'package:demo/widgets/room_list_item_widget.dart';
import 'package:demo/widgets/search_bar/index.dart';
import 'package:flutter/material.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key key}) : super(key: key);

  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: SearchBar(
          showLocation: true,
          showMap: true,
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 41.0,
            child: FilterBar(
              onChange: (data) {},
            ),
          ),
          Expanded(
            child: ListView(
              children:
                  dataList.map((item) => RoomListItemWidget(item)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
