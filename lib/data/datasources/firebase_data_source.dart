import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/car.dart';

class FirebaseCarDataSource{
  final FirebaseFirestore firestore;

  FirebaseCarDataSource({required this.firestore});

  Future<List<Car>> GetCars() async{
    var snapshot = await firestore.collection('cars').get();
    return snapshot.docs.map((doc)=> Car.fromMap(doc.data())).toList();
  }
}