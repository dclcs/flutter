import 'package:demo/pages/home/tab_profile/function_button_data.dart';
import 'package:demo/widgets/common_image.dart';
import 'package:flutter/material.dart';

class FunctionButtonWidget extends StatelessWidget {
  final FunctionButtonItem data;

  const FunctionButtonWidget(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (null != data.onTapHandle) {
          data.onTapHandle(context);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.33,
        margin: EdgeInsets.only(top: 30.0),
        child: Column(
          children: <Widget>[
            CommonImage(src: data.imageUrl),
            Text(data.title),
          ],
        ),
      ),
    );
  }
}
