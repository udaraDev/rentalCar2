import 'package:build_car_rental_app_flutter/domain/repositories/car_repository.dart';
import '../../data/model/car.dart';
import '../repositories/car_repository.dart';

class GetCars  {
  final CarRespository respository;

  GetCars(this.respository);

  Future<List<Car>> call() async{
    return await respository.fetchCars();
  }
}
//dependency injection