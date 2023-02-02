import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text =
        "admin"; // ใช้ _ จะเป็น private ไม่ใส่เป็น public
    _passwordController.text = "123456";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(32),
              height: 320,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ..._buildTextField(),
                    const SizedBox(
                      height: 32,
                    ),
                    ..._buildButtons()
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void _handleClickLogin() {
    print(
        "ArtDev: Login with ${_usernameController.text}, ${_passwordController.text} ;");
  }

  void _handleClickReset() {
    _usernameController.text = "";
    _passwordController.text = "";
  }

  _buildButtons() {
    return [
      ElevatedButton(
        onPressed: _handleClickLogin,
        child: const Text("Login"),
      ),
      OutlinedButton(
        onPressed: _handleClickReset,
        child: const Text("Reset"),
      )
    ];
  }

  _buildTextField() {
    return [
      TextField(
        controller: _usernameController,
        decoration: const InputDecoration(labelText: "Username"),
      ),
      TextField(
        controller: _passwordController,
        decoration: const InputDecoration(labelText: "Password"),
      )
    ];
  }
}
