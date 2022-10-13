import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_2/buttons/grey_button.dart';
import 'package:task_manager_2/buttons/grey_text_button.dart';

class SignPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const SignPage({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60.5,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 22.41,
                ),
                Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                )
              ],
            ),
            const SizedBox(
              height: 40.5,
            ),
            const Text(
              'Sign in',
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            TextField(
              controller: emailController,
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: passwordController,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Forgot password?',
              style: TextStyle(
                color: Color.fromRGBO(217, 217, 217, 1),
                fontStyle: FontStyle.normal,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            GreyButton(onPress: signIn, text: 'Sign in'),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'or continue with',
              style: TextStyle(
                color: Color.fromRGBO(217, 217, 217, 1),
                fontStyle: FontStyle.normal,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GreyButton(onPress: () {}, text: 'google'),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                GreyTextButton(
                    onPress: widget.onClickedSignUp, text: 'Create one'),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
