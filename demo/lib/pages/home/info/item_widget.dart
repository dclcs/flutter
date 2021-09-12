import 'package:demo/pages/home/info/data.dart';
import 'package:demo/widgets/common_image.dart';
import 'package:flutter/material.dart';

var textStyle = TextStyle(color: Colors.black54);

class ItemWiget extends StatelessWidget {
  final InfoItem data;

  const ItemWiget(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          CommonImage(
            src: data.imageUrl,
            width: 120.0,
            height: 90.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  data.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      data.source,
                      style: textStyle,
                    ),
                    Text(
                      data.time,
                      style: textStyle,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
