import 'dart:io';

import 'package:demo/widgets/common_floating_action_button.dart';
import 'package:demo/widgets/common_form_item.dart';
import 'package:demo/widgets/common_image_picker.dart';
import 'package:demo/widgets/common_radio_form_item.dart';
import 'package:demo/widgets/common_select_form_item.dart';
import 'package:demo/widgets/common_title.dart';
import 'package:demo/widgets/room_appliance.dart';
import 'package:flutter/material.dart';

class RoomAddPage extends StatefulWidget {
  const RoomAddPage({Key key}) : super(key: key);

  @override
  _RoomAddPageState createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  int rentType = 0;
  int decorationType = 0;

  int roomType = 0;
  int floor = 0;
  int oriented = 0;

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('房源发布'),
      ),
      body: ListView(
        children: <Widget>[
          CommonTitle('房源信息'),
          CommonFormItem(
            label: '小区',
            contentBuilder: (context) {
              return Container(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '请选择小区',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('search');
                  },
                ),
              );
            },
            controller: TextEditingController(),
          ),
          CommonFormItem(
            label: '租金',
            hintText: '请输入租金',
            suffixText: '元/月',
            controller: TextEditingController(),
          ),
          CommonFormItem(
            label: '大小',
            hintText: '请输入房屋大小',
            suffixText: '平方米',
            controller: TextEditingController(),
          ),
          CommonSelectFormItem(
            label: '户型',
            value: roomType,
            onChange: (val) {
              setState(() {
                roomType = val;
              });
            },
            options: ['一', '二', '三', '四'],
          ),
          CommonSelectFormItem(
            label: '楼层',
            value: floor,
            onChange: (val) {
              setState(() {
                floor = val;
              });
            },
            options: ['高楼层', '中楼层', '低楼层'],
          ),
          CommonSelectFormItem(
            label: '朝向',
            value: oriented,
            onChange: (val) {
              setState(() {
                oriented = val;
              });
            },
            options: ['东', '西', '南', '北'],
          ),
          CommonRadioFormItem(
            label: '租赁方式',
            options: ['合租', '整租'],
            value: rentType,
            onChange: (index) {
              setState(() {
                rentType = index;
              });
            },
          ),
          CommonRadioFormItem(
            label: '装修',
            options: ['精装', '简装'],
            value: decorationType,
            onChange: (index) {
              setState(() {
                decorationType = index;
              });
            },
          ),
          CommonTitle('房源图像'),
          CommonImagePicker(onChange: (List<File> files) {}),
          CommonTitle('房源标题'),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "请输入标题",
              ),
            ),
          ),
          CommonTitle('房源配置'),
          RoomAppliance(
            onChanged: (data) {},
          ),
          CommonTitle('房源描述'),
          Container(
            margin: EdgeInsets.only(bottom: 100.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: descriptionController,
              maxLines: 10,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "请输入房屋描述信息",
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingActionButton('提交', () {}),
    );
  }
}
