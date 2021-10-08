import 'package:demo/widgets/common_form_item.dart';
import 'package:flutter/material.dart';

class CommonRadioFormItem extends StatelessWidget {
  final String label;
  final List<String> options;
  final int value;
  final ValueChanged onChange;

  const CommonRadioFormItem(
      {Key key, this.label, this.options, this.value, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuilder: (context) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                options.length,
                (index) => Row(
                      children: <Widget>[
                        Radio(
                          value: index,
                          groupValue: value,
                          onChanged: onChange,
                        ),
                        Text(options[index]),
                      ],
                    )),
          ),
        );
      },
    );
  }
}
