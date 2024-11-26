import 'package:bloc/bloc.dart';
import 'package:build_car_rental_app_flutter/domain/usecase/get_cars.dart';
import 'package:build_car_rental_app_flutter/pressentation/bloc/car_event.dart';
import 'package:build_car_rental_app_flutter/pressentation/bloc/car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState>{
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarsLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarsLoading());
      try{
        final cars = await getCars.call ();
        emit(CarsLoaded(cars));

      }catch(e){
        emit(CarsError(e.toString()));
      }
    });
  }
}