import 'package:demo/widgets/common_image.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final bool showLocation;
  final Function goBackCallback;
  final String inputValue;
  final String defaultInputValue;
  final Function onCancel;
  final bool showMap;
  final Function onSearch;
  final ValueChanged<String> onSearchSubmit;

  const SearchBar(
      {Key key,
      this.showLocation,
      this.goBackCallback,
      this.inputValue = '',
      this.defaultInputValue = "请输入搜索词",
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  TextEditingController _controller;
  FocusNode _focus;
  _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = '';
    });
  }

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (widget.showLocation != null)
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {},
                child: Row(children: <Widget>[
                  Icon(Icons.room, color: Colors.green, size: 16.0),
                  Text('北京',
                      style: TextStyle(color: Colors.black, fontSize: 14.0)),
                ]),
              )),
        if (widget.goBackCallback != null)
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
                onTap: widget.goBackCallback,
                child: Icon(Icons.chevron_left, color: Colors.black87)),
          ),
        Expanded(
          child: Container(
            height: 34.0,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(17.0)),
            margin: EdgeInsets.only(right: 10.0),
            child: TextField(
              focusNode: _focus,
              onTap: () {
                if (null == widget.onSearchSubmit) {
                  _focus.unfocus();
                }
                widget.onSearch();
              },
              onSubmitted: widget.onSearchSubmit,
              textInputAction: TextInputAction.search,
              controller: _controller,
              style: TextStyle(fontSize: 14.0),
              onChanged: (String value) {
                setState(() {
                  _searchWord = value;
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入搜索词',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                contentPadding:
                    EdgeInsets.only(top: 8.0, left: -10.0, bottom: 10.0),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _onClean();
                  },
                  child: Icon(
                    Icons.clear,
                    size: 18.0,
                    color: _searchWord == '' ? Colors.grey[200] : Colors.grey,
                  ),
                ),
                icon: Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                  child: Icon(
                    Icons.search,
                    size: 18.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (widget.onCancel != null)
          GestureDetector(
            onTap: widget.onCancel,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text('取消',
                  style: TextStyle(fontSize: 14.0, color: Colors.black)),
            ),
          ),
        if (widget.showMap != null)
          CommonImage(src: 'static/icons/widget_search_bar_map.png')
      ],
    );
  }
}
