import 'package:first_app/src/bloc/login/login_bloc.dart';
import 'package:first_app/src/pages/home/home_page.dart';
import 'package:first_app/src/pages/login/login_page.dart';
import 'package:first_app/src/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider(create: (context) => LoginBloc());
    // final testBloc = BlocProvider(create: (context) => LoginBloc());  สมมุติ มีหลายชุด
    return MultiBlocProvider(
        providers: [loginBloc],
        child: MaterialApp(
          title: "CMApp",
          routes: AppRoute.all,
          home: const LoginPage(),
        ));
  }
}
