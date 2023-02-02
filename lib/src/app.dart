import 'package:first_app/src/pages/home/home_page.dart';
import 'package:first_app/src/pages/login/login_page.dart';
import 'package:first_app/src/pages/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CMApp",
      routes: AppRoute.all,
      home: LoginPage(),
    );
  }
}
