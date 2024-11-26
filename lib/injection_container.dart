import 'package:build_car_rental_app_flutter/data/datasources/firebase_data_source.dart';
import 'package:build_car_rental_app_flutter/data/repositories/car_repository_impl.dart';
import 'package:build_car_rental_app_flutter/domain/repositories/car_repository.dart';
import 'package:build_car_rental_app_flutter/domain/usecase/get_cars.dart';
import 'package:build_car_rental_app_flutter/pressentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection(){
  try{
  getIt.registerLazySingleton<FirebaseFirestore>(()=> FirebaseFirestore.instance);
  getIt.registerLazySingleton<FirebaseCarDataSource>(
          ()=> FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>())
  );
  getIt.registerLazySingleton<CarRepositoryImpl>(
          ()=> CarRepositoryImpl(getIt<FirebaseCarDataSource>())
  );
  getIt.registerLazySingleton<GetCars>(
          ()=> GetCars(getIt<CarRespository>())
  );
  getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>())
  );
  }catch(e){
    throw e;
  }
}