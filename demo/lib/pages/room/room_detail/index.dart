import 'package:demo/pages/home/info/index.dart';
import 'package:demo/pages/room/room_detail/data.dart';
import 'package:demo/widgets/common_swipper.dart';
import 'package:demo/widgets/common_tags.dart';
import 'package:demo/widgets/common_title.dart';
import 'package:demo/widgets/room_appliance.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

var bottomButtonStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.white,
);

class RoomDetailPage extends StatefulWidget {
  final String roomId;

  const RoomDetailPage({Key key, this.roomId}) : super(key: key);

  @override
  _RoomDetailPageState createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  RoomDetailData data;
  bool isLike = false;
  bool showAllText = false;
  @override
  void initState() {
    setState(() {
      data = defaultData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (null == data) return Container();

    bool showTextTool = data.subTitle.length > 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share('https://itecast.cn');
              })
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              CommonSwipper(
                images: data.houseImgs,
              ),
              CommonTitle(data.title),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      data.price.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.pink,
                      ),
                    ),
                    Text(
                      '???/??? ????????????',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
                child: Wrap(
                  spacing: 4.0,
                  children: data.tags.map((item) => CommonTag(item)).toList(),
                ),
              ),
              Divider(
                color: Colors.grey,
                indent: 10.0,
                endIndent: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
                child: Wrap(
                  runSpacing: 20.0,
                  children: <Widget>[
                    BaseInfoItem(content: '??????: ${data.size}??????'),
                    BaseInfoItem(content: '??????: ${data.floor}'),
                    BaseInfoItem(content: '??????: ${data.roomType}??????'),
                    BaseInfoItem(content: '??????: ??????'),
                  ],
                ),
              ),
              CommonTitle('????????????'),
              RoomApplicanceList(
                list: data.applicances,
              ),
              CommonTitle('????????????'),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.subTitle ?? '??????????????????',
                      maxLines: showAllText ? null : 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        showTextTool
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllText = !showAllText;
                                  });
                                },
                                child: Row(
                                  children: <Widget>[
                                    Text(showAllText ? '??????' : '??????'),
                                    Icon(showAllText
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down),
                                  ],
                                ),
                              )
                            : Container(),
                        Text('??????'),
                      ],
                    )
                  ],
                ),
              ),
              CommonTitle('????????????'),
              Info(),
              Container(
                height: 100.0,
              ),
            ],
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.only(
                  top: 10.0, left: 20.0, bottom: 20.0, right: 20.0),
              color: Colors.grey[200],
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLike = !isLike;
                      });
                    },
                    child: Container(
                      height: 50.0,
                      width: 40.0,
                      margin: EdgeInsets.only(right: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            isLike ? Icons.star : Icons.star_border,
                            size: 24.0,
                            color: isLike ? Colors.green : Colors.black,
                          ),
                          Text(
                            isLike ? '?????????' : '??????',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 50.0,
                          margin: EdgeInsets.only(right: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Center(
                              child: Text(
                            '????????????',
                            style: bottomButtonStyle,
                          ))),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Center(
                              child: Text(
                            '????????????',
                            style: bottomButtonStyle,
                          ))),
                    ),
                  ),
                ],
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            bottom: 0,
          )
        ],
      ),
    );
  }
}

class BaseInfoItem extends StatelessWidget {
  final String content;

  const BaseInfoItem({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        content,
        style: TextStyle(fontSize: 16.0),
      ),
      width: (MediaQuery.of(context).size.width - 3 * 10) / 2,
    );
  }
}
