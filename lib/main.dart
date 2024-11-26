import 'package:build_car_rental_app_flutter/injection_container.dart';
import 'package:build_car_rental_app_flutter/pressentation/pages/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pressentation/pages/maps_details_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options : DefaultFirebaseOptions.currentPlatform
  );
  initInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Rental App',
      home: OnboardingPage(),
    );
  }
}
