import 'package:flutter/material.dart';
import 'package:task_manager_2/pages/sign_page.dart';
import 'package:task_manager_2/pages/sign_up_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? SignPage(onClickedSignUp: toggle)
      : SignUpPage(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
