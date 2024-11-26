import '../../data/model/car.dart';

abstract class CarRespository {
  Future<List<Car>> fetchCars();
}
