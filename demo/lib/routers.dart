import 'package:demo/pages/home/index.dart';
import 'package:demo/pages/login.dart';
import 'package:demo/pages/not_found.dart';
import 'package:demo/pages/register.dart';
import 'package:demo/pages/room/room_detail/index.dart';
import 'package:demo/pages/room_manage/index.dart';
import 'package:demo/pages/room_manage/room_add/index.dart';
import 'package:demo/pages/settings.dart';
import 'package:fluro/fluro.dart' as route;
import 'package:flutter/material.dart';

class Routes {
  // 1. 定义路由名称
  static String home = "/";
  static String login = "/login";
  static String register = "/register";
  static String roomDetail = "/roomDetail/:roomId";
  static String setting = "/setting";
  static String roomManage = "/roomManage";
  static String roomAdd = '/roomAdd';
  // 定义路由处理函数
  static route.Handler _homeHandler =
  route.Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return HomePage();
  });

  static route.Handler _loginHandler =
  route.Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return LoginPage();
  });

  static route.Handler _registerHandler =
  route.Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RegisterPage();
  });

  static route.Handler _roomDetailHandler =
  route.Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomDetailPage(roomId: params['roomId'][0]);
  });

  static route.Handler _settingHandler =
  route.Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return SettingPage();
  });

  static route.Handler _roomManageHandler =
  route.Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomManagePage();
  });

  static route.Handler _roomAddHandler =
  route.Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomAddPage();
  });

  static route.Handler _notFoundHandler = route.Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return NotFoundPage();
  });

  // 编写configureRoutes方法
  static void configureRoutes(route.Router router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(register, handler: _registerHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.define(setting, handler: _settingHandler);
    router.define(roomManage, handler: _roomManageHandler);
    router.define(roomAdd, handler: _roomAddHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
