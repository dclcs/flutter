import 'package:demo/pages/home/tab_search/data_list.dart';
import 'package:demo/widgets/common_image.dart';
import 'package:demo/widgets/common_tags.dart';
import 'package:flutter/material.dart';

class RoomListItemWidget extends StatelessWidget {
  final RoomListItemData data;

  const RoomListItemWidget(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("roomDetail/${data.id}");
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            CommonImage(
              src: data.imageUrl,
              width: 132.5,
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    data.subTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Wrap(
                    children: data.tags.map((item) => CommonTag(item)).toList(),
                  ),
                  Text(
                    '${data.price}元/月',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
