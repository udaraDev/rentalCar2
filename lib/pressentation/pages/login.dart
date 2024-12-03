import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Text("Login", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
