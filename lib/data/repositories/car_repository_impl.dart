import 'package:build_car_rental_app_flutter/data/datasources/firebase_data_source.dart';
import 'package:build_car_rental_app_flutter/data/model/car.dart';
import 'package:build_car_rental_app_flutter/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRespository{
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.GetCars();

  }

}