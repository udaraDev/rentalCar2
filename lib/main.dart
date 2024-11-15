import 'package:build_car_rental_app_flutter/pressentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'data/model/car.dart';  // Nếu tên file là 'car.dart'
import 'pressentation/pages/maps_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Tạo đối tượng Car để truyền vào
    // Car yourCarObject = Car(
    //   model: 'Toyota Camry',
    //   distance: 150.0,
    //   fuelCapacity: 50.0,
    //   pricePerHour: 20.0,
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Rental App',
      home: OnboardingPage(),
    );
  }
}
