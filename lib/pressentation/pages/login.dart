import 'package:build_car_rental_app_flutter/Auth/firebase_auth.dart';
import 'package:build_car_rental_app_flutter/pressentation/pages/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  late FocusNode passwordFieldFocusNode;
  late FocusNode emailFieldFocusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordFieldFocusNode = FocusNode();
    emailFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    passwordFieldFocusNode.dispose();
    emailFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          // Wrap the entire column inside a Center widget
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center content horizontally
            children: [
              const Column(
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text("Enter your credential to login"),
                ],
              ),
              Container(
                height: 250.0,
                width: 250.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Email Field with Validation
                    _commonTextField(
                      focusNode: emailFieldFocusNode,
                      autofocus: true, // focus this field when the page loads
                      hintText: "Email Address",
                      prefixIcon: const Icon(Icons.email),
                      controller: emailTextController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Password Field with Validation
                    _commonTextField(
                      focusNode: passwordFieldFocusNode,
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      controller: passwordTextController,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Login Button
                    ElevatedButton(
                      onPressed: () async {
                        // Validate the form before proceeding
                        if (_formKey.currentState?.validate() ?? false) {
                          // Proceed with login
                          await AuthService().signIn(
                            email: emailTextController.text,
                            password: passwordTextController.text,
                            context: context,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              // const Center(
              //   child: Text("Or"),
              // ),
              // const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () async {
              //     await AuthService().signIn(
              //       email: emailTextController.text,
              //       password: passwordTextController.text,
              //       context: context,
              //     );
              //   },
              //   style: ElevatedButton.styleFrom(
              //     shape: const StadiumBorder(),
              //     padding: const EdgeInsets.symmetric(vertical: 16),
              //     backgroundColor: Colors.blue,
              //   ),
              //   child: const Text(
              //     "Sign up",
              //     style: TextStyle(fontSize: 20, color: Colors.white),
              //   ),
              // ),
              // TextButton(
              //   onPressed: () {},
              //   child: const Text(
              //     "Forgot password?",
              //     style: TextStyle(color: Colors.blue),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Signup())));
                    },
                    child: const Text(
                      "Sign Up",
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
      isPassword = false,
      validator}) {
    return TextFormField(
      focusNode: focusNode,
      autofocus: autofocus,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.blue.withOpacity(0.1),
        filled: true,
        prefixIcon: prefixIcon,
      ),
      validator: validator, // Attach validator
    );
  }
}
