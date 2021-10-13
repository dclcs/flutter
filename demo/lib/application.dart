import 'package:demo/pages/home/index.dart';
import 'package:demo/pages/login.dart';
import 'package:demo/routers.dart';
import 'package:fluro/fluro.dart' as route;
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    route.Router router = route.Router();
    Routes.configureRoutes(router);
    return MaterialApp(
      // home: LoginPage(),
      theme: ThemeData(primaryColor: Colors.green),
      onGenerateRoute: router.generator,
    );
  }
}
