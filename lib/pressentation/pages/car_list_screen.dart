import 'package:bloc/bloc.dart';
import 'package:build_car_rental_app_flutter/pressentation/bloc/car_bloc.dart';
import 'package:build_car_rental_app_flutter/pressentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/car.dart';

class CarListScreen extends StatelessWidget {


  final List<Car> cars = [
    Car(model: 'Mercedes-Benz G-Class', distance: 270, fuelCapacity: 50, pricePerHour: 45),
    Car(model: 'Mercedes-Benz G-Class', distance: 270, fuelCapacity: 50, pricePerHour: 45),
    Car(model: 'Mercedes-Benz G-Class', distance: 270, fuelCapacity: 50, pricePerHour: 45),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(itemCount: cars.length,
        itemBuilder: (context,index){
          return CarCard(car: cars[index]);
        },
      ),
    );
  }
}