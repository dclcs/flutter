import 'package:demo/pages/home/tab_search/filter_bar/data.dart';
import 'package:demo/widgets/common_title.dart';
import 'package:flutter/material.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedIds = ['11', 'aa', '99'];
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            CommonTitle('户型'),
            FilterDrawerItem(
              list: roomTypeList,
              selectedIds: selectedIds,
            ),
            CommonTitle('炒香'),
            FilterDrawerItem(
              list: orientedList,
              selectedIds: selectedIds,
            ),
            CommonTitle('楼层'),
            FilterDrawerItem(
              list: floorList,
              selectedIds: selectedIds,
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDrawerItem extends StatelessWidget {
  final List<GeneralType> list;
  final List<String> selectedIds;
  final ValueChanged<String> onChange;
  const FilterDrawerItem({
    Key key,
    this.list,
    this.selectedIds,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: list.map((item) {
          var isActive = selectedIds.contains(item);
          return GestureDetector(
            onTap: () {
              if (onChange != null) onChange(item.id);
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: isActive? Colors.green : Colors.white,
                  border: Border.all(width: 1.0, color: Colors.green),),
              child: Center(
                child: Text(
                  item.name,
                  style:
                      TextStyle(color: isActive ? Colors.white : Colors.green),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
