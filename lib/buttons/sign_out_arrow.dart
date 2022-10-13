import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOutArrow extends StatelessWidget {
  const SignOutArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => FirebaseAuth.instance.signOut(),
      icon: const Icon(Icons.arrow_back_ios_new),
      color: Colors.black,
    );
  }
}
