import 'package:bandnames/pages/home_page.dart';
import 'package:bandnames/routes/routes.dart';
import 'package:bandnames/theme/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Band names App',
      initialRoute: HomePage.routeName,
      routes: routes,
      theme: theme,
    );
  }
}
