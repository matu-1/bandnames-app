import 'package:bandnames/pages/home_page.dart';
import 'package:bandnames/pages/status_page.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (_) => HomePage(),
  StatusPage.routeName: (_) => StatusPage(),
};
