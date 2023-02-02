import 'package:first_app/src/bloc/login/login_bloc.dart';
import 'package:first_app/src/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  int count = 0;

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
              height: 420,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ..._buildTextField(),
                    const SizedBox(
                      height: 32,
                    ),
                    ..._buildButtons(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: _handleClickRemove,
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                            "Debug: ${context.read<LoginBloc>().state.count}"), //read state count
                        IconButton(
                          onPressed: _handleClickAdd,
                          icon: const Icon(Icons.add),
                        )
                      ],
                    )
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
    Navigator.pushNamed(context, AppRoute.home);
  }

  void _handleClickReset() {
    _usernameController.text = "";
    _passwordController.text = "";
  }

  void _handleClickRegister() {
    Navigator.pushNamed(context, AppRoute.register);
  }

  void _handleClickAdd() {
    setState(() {
      count++;
    });
  }

  void _handleClickRemove() {
    count--;
    setState(() {});
  }

  _buildButtons() {
    return [
      ElevatedButton(
        onPressed: _handleClickLogin,
        child: const Text("Login"),
      ),
      OutlinedButton(
        onPressed: _handleClickRegister,
        child: const Text("Register"),
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
