import 'package:build_car_rental_app_flutter/Auth/firebase_auth.dart';
import 'package:build_car_rental_app_flutter/pressentation/pages/login.dart';
import 'package:flutter/material.dart';

// import 'package:mobile_event_planner/sign_up/widgets/social_signup_button.dart';
// import '../widgets/signup_form.dart';
// import '../widgets/login_redirect.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final usernameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();

  late FocusNode userNameFieldFocusNode;
  late FocusNode emailFieldFocusNode;
  late FocusNode passwordFieldFocusNode;
  late FocusNode confirmPasswordFocusNode;
  late FocusNode firstNameFieldFocusNode;
  late FocusNode lastNameFieldFocusNode;

  @override
  void initState() {
    userNameFieldFocusNode = FocusNode();
    emailFieldFocusNode = FocusNode();
    passwordFieldFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    firstNameFieldFocusNode = FocusNode();
    lastNameFieldFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    usernameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    firstNameTextController.dispose();
    lastNameTextController.dispose();

    userNameFieldFocusNode.dispose();
    emailFieldFocusNode.dispose();
    passwordFieldFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    firstNameFieldFocusNode.dispose();
    lastNameFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 60.0),
              Column(
                children: <Widget>[
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _commonTextField(
                      hintText: "First name",
                      prefixIcon: const Icon(Icons.person),
                      controller: firstNameTextController,
                      focusNode: firstNameFieldFocusNode),
                  const SizedBox(height: 20),
                  _commonTextField(
                      hintText: "Last name",
                      prefixIcon: const Icon(Icons.person),
                      controller: lastNameTextController,
                      focusNode: lastNameFieldFocusNode),
                  const SizedBox(height: 20),
                  _commonTextField(
                      hintText: "Username",
                      prefixIcon: const Icon(Icons.person),
                      controller: usernameTextController,
                      focusNode: userNameFieldFocusNode),
                  const SizedBox(height: 20),
                  _commonTextField(
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      controller: emailTextController,
                      focusNode: emailFieldFocusNode),
                  const SizedBox(height: 20),
                  _commonTextField(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.password),
                      controller: passwordTextController,
                      isPassword: true,
                      focusNode: passwordFieldFocusNode),
                  const SizedBox(height: 20),
                  _commonTextField(
                      hintText: "Confirm Password",
                      prefixIcon: const Icon(Icons.password),
                      controller: confirmPasswordTextController,
                      isPassword: true,
                      focusNode: confirmPasswordFocusNode),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final authService = AuthService();
                      await authService.signup(
                        email: emailTextController.text.trim(),
                        password: passwordTextController.text.trim(),
                        username: usernameTextController.text.trim(),
                        firstName: firstNameTextController.text.trim(),
                        lastName: lastNameTextController.text.trim(),
                        context: context,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Login())));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _commonTextField(
      {required focusNode,
      autofocus = false,
      required controller,
      required hintText,
      required prefixIcon,
      isPassword = false}) {
    return TextField(
      focusNode: focusNode,
      autofocus: autofocus,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none),
        fillColor: Colors.blue.withOpacity(0.1),
        filled: true,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
