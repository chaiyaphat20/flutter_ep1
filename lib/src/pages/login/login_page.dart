import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        color: Colors.teal.withOpacity(0.2),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Text("chaiyaphat.com"),color: Colors.blueGrey,),
            Container(child: Text("chaiyaphat.com"),color: Colors.yellowAccent,),
            Text("chaiyaphat.com"),
            Text("chaiyaphat.com"),
          ],
        ),
      ),
    );
  }
}