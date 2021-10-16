import 'dart:async';

import 'package:demo/pages/home/tab_search/filter_bar/data.dart';
import 'package:demo/pages/home/tab_search/filter_bar/item.dart';
import 'package:demo/scroped_model/room_filter.dart';
import 'package:demo/utils/common_picker/index.dart';
import 'package:demo/utils/scoped_model_helper.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult> onChange;

  const FilterBar({Key key, this.onChange}) : super(key: key);

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isAreaActive = false;
  bool isRentTypeActive = false;
  bool isPriceActive = false;
  bool isFilterActive = false;

  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  _onAreaChange(context) {
    setState(() {
      isAreaActive = true;
    });
    var result = CommonPicker.showPicker(
      context: context,
      options: areaList.map((item) => item.name).toList(),
      value: 0,
    );
    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = areaList[index].id;
      });
      _onChange();
    }).whenComplete(() {
      setState(() {
        isAreaActive = false;
      });
    });
  }

  _onRentTypeChange(context) {
    setState(() {
      isRentTypeActive = true;
    });
    var result = CommonPicker.showPicker(
      context: context,
      options: rentTypeList.map((item) => item.name).toList(),
      value: 0,
    );
    result.then((index) {
      if (index == null) return;
      setState(() {
        rentTypeId = rentTypeList[index].id;
      });
      _onChange();
    }).whenComplete(() {
      setState(() {
        isRentTypeActive = false;
      });
    });
  }

  _onPriceChange(context) {
    setState(() {
      isPriceActive = true;
    });
    var result = CommonPicker.showPicker(
      context: context,
      options: priceList.map((item) => item.name).toList(),
      value: 0,
    );
    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = priceList[index].id;
      });
      _onChange();
    }).whenComplete(() {
      setState(() {
        isPriceActive = false;
      });
    });
  }

  _onFilterChange(context) {}

  _onChange() {
    var selectedList = ScopedModelHelper.getModel<FilterBarModel>(context).selectedList;
    if (widget.onChange != null) {
      widget.onChange(FilterBarResult(
          areaId: areaId,
          rentTypeId: rentTypeId,
          priceId: priceId,
          moreIds: selectedList.toList()));
    }
  }

  _getData() {
    var dataList = Map<String, List<GeneralType>>();
    dataList['roomTypeList'] = roomTypeList;
    dataList['orientedList'] = orientedList;
    dataList['floorList'] = floorList;


    ScopedModelHelper.getModel<FilterBarModel>(context).dataList = dataList;
  }
  @override
  void initState() {
    Timer.run(_getData);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _onChange();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.0,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.black12,
        width: 1.0,
      ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Item(
            title: '区域',
            isActive: isAreaActive,
            onTap: _onAreaChange,
          ),
          Item(
            title: '方式',
            isActive: isRentTypeActive,
            onTap: _onRentTypeChange,
          ),
          Item(
            title: '租金',
            isActive: isPriceActive,
            onTap: _onPriceChange,
          ),
          Item(
            title: '删选',
            isActive: isFilterActive,
            onTap: _onFilterChange,
          ),
        ],
      ),
    );
  }
}
