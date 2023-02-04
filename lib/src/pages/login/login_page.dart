import 'package:first_app/src/bloc/login/login_bloc.dart';
import 'package:first_app/src/models/user.dart';
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

  @override
  void initState() {
    super.initState();
    _usernameController.text =
        "admin"; // ใช้ _ จะเป็น private ไม่ใส่เป็น public
    _passwordController.text = "1234";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Text("Login Page: ${state.count}");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(32),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ..._buildTextField(),
                      const SizedBox(
                        height: 32,
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return Text(
                            "Login Result: ${state.isAuthen ? "Success" : "Error"}",
                            style: TextStyle(
                                color:
                                    state.isAuthen ? Colors.green : Colors.red),
                          );
                        },
                      ),
                      ..._buildButtons(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => _handleClickRemove(context),
                            icon: const Icon(Icons.remove),
                          ),
                          BlocBuilder<LoginBloc, LoginState>(
                            //จะ rerender เฉพาะ UI ตรงนี้
                            // หุ้มไว้
                            builder: (context, state) {
                              // "Debug: ${context.read<LoginBloc>().state.count}");
                              return Text("DebugX: ${state.count}");
                            },
                          ), //read state count
                          IconButton(
                            onPressed: () =>
                                context.read<LoginBloc>().add(LoginEventAdd()),
                            icon: const Icon(Icons.add),
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleClickLogin() {
    // print(
    //     "ArtDev: Login with ${_usernameController.text}, ${_passwordController.text} ;");
    final user = User(
        username: _usernameController.text, password: _passwordController.text);

    final loginBloc = context.read<LoginBloc>();
    loginBloc.add(LoginEventLogin(user));

    // Navigator.pushNamed(context, AppRoute.home);
  }

  void _handleClickReset() {
    _usernameController.text = "";
    _passwordController.text = "";
  }

  void _handleClickRegister() {
    Navigator.pushNamed(context, AppRoute.register);
  }

  void _handleClickRemove(BuildContext context) {
    context.read<LoginBloc>().add(
        LoginEventRemove()); //ข้อดี ถือ มันจะ render แค่ UI นั้นๆ ไม่ render ใหม่ เหมือน state
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
