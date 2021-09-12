import 'package:demo/pages/home/tab_index/index_recommond_data.dart';
import 'package:demo/widgets/common_image.dart';
import 'package:flutter/material.dart';

var textStyle = TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500);

class IndexRecommondItemWidget extends StatelessWidget {
  final IndexRecommondItem data;

  const IndexRecommondItemWidget(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(data.navigateUrl);
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        width: (MediaQuery.of(context).size.width - 10.0 * 3) / 2,
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  data.title,
                  style: textStyle,
                ),
                Text(
                  data.subTitle,
                  style: textStyle,
                )
              ],
            ),
            CommonImage(
              src: data.imageUrl,
              width: 55.0,
            )
          ],
        ),
      ),
    );
  }
}
