import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:user_manager/ui/screen/home_screen.dart';
import 'package:user_manager/ui/state_holders/auth_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _userNameTEC = TextEditingController();
  final _passwordTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signInText(),
            const SizedBox(
              height: 30,
            ),
            _emailTextField(),
            _passwordTextField(),
            _signInButton(),
          ].separatedBy(const SizedBox(
            height: 15,
          )),
        ),
      ),
    );
  }

  Widget _signInButton() => ElevatedButton(
      onPressed: () {
        if (_userNameTEC.text == "tofa" && _passwordTEC.text == "nibir") {
          AuthController.saveLogin();
          context.navigator.pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      },
      child: const Text('Sign In'));

  TextFormField _emailTextField() {
    return TextFormField(
      controller: _userNameTEC,
      decoration: const InputDecoration(hintText: 'User name'),
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      controller: _passwordTEC,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signInText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }
}
