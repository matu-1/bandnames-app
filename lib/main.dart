// import 'package:bandnames/pages/home_page.dart';
import 'package:bandnames/pages/home_page.dart';
import 'package:bandnames/pages/status_page.dart';
import 'package:bandnames/routes/routes.dart';
import 'package:bandnames/services/socket_service.dart';
import 'package:bandnames/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => new SocketService())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Band names App',
        initialRoute: HomePage.routeName,
        routes: routes,
        theme: theme,
      ),
    );
  }
}
