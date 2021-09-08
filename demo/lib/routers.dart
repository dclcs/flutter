import 'package:demo/pages/home/index.dart';
import 'package:demo/pages/login.dart';
import 'package:demo/pages/not_found.dart';
import 'package:demo/pages/register.dart';
import 'package:demo/pages/room/room_detail/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  // 1. 定义路由名称
  static String home = "/";
  static String login = "/login";
  static String register = "/register";
  static String roomDetail = "/room/:roomId";

  // 定义路由处理函数
  static Handler _homeHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return HomePage();
  });

  static Handler _loginHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return LoginPage();
  });

  static Handler _registerHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RegisterPage();
  });

  static Handler _roomDetailHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomDetailPage(roomId: params['roomId'][0]);
  });

  static Handler _notFoundHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return NotFoundPage();
  });

  // 编写configureRoutes方法
  static void configureRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(register, handler: _registerHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
