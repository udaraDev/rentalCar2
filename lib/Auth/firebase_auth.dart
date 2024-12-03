import 'package:build_car_rental_app_flutter/pressentation/pages/car_list_screen.dart';
import 'package:build_car_rental_app_flutter/pressentation/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:mobile_event_planner/login_page/screens/login_page.dart';
// import 'package:mobile_event_planner/main_layout/screens/main_layout.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signup({
    required String email,
    required String password,
    required String username,
    required String firstName,
    required String lastName,
    required BuildContext context,
  }) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the UID of the created user
      String uid = userCredential.user!.uid;

      // Save additional user details to Firestore
      await _firestore.collection("users").doc(uid).set({
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "isVerified": false, // User is not verified by default
        "createdAt":
            FieldValue.serverTimestamp(), // Store account creation time
      });

      // Navigate to the HomePage
      await Future.delayed(const Duration(seconds: 1));
      if (!context.mounted) return;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => CarListScreen()));

      // Success message
      Fluttertoast.showToast(
        msg: "Signup successful!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is not valid.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      // Generic error message
      Fluttertoast.showToast(
        msg: "An error occurred: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Validate input before attempting login
      if (email.isEmpty || password.isEmpty) {
        throw FirebaseAuthException(
          code: 'empty-fields',
          message: 'Email and password cannot be empty.',
        );
      }

      // Attempt sign-in
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Check if user is successfully authenticated
      if (userCredential.user != null) {
        // Navigate only when the user is authenticated
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CarListScreen()),
        );

        // Optionally, display a success message
        Fluttertoast.showToast(
          msg: "Sign-in successful!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 14.0,
        );
      } else {
        // Handle cases where userCredential is null (rare edge case)
        throw FirebaseAuthException(
          code: 'null-user',
          message: 'Failed to retrieve user information.',
        );
      }
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'No user found with this email.';
          break;
        case 'wrong-password':
          message = 'Incorrect password. Please try again.';
          break;
        case 'invalid-email':
          message = 'The email address is invalid.';
          break;
        case 'user-disabled':
          message = 'This user has been disabled. Please contact support.';
          break;
        case 'empty-fields':
          message = e.message ?? 'Please fill in all fields.';
          break;
        default:
          message = 'An error occurred: ${e.message}';
      }

      // Display the error message
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );

      // Debugging (optional)
      debugPrint('FirebaseAuthException: ${e.code}, ${e.message}');
    } catch (e) {
      // Handle unexpected errors
      Fluttertoast.showToast(
        msg: 'An unexpected error occurred. Please try again.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
      debugPrint('Unexpected error: $e');
    }
  }

  Future<void> signout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    var future = Future.delayed(const Duration(seconds: 1));
    await future;
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => const Login()));
  }
}
