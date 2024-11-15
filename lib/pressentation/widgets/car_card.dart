import 'package:build_car_rental_app_flutter/pressentation/pages/car_details_page.dart';
import 'package:flutter/material.dart';

import '../../data/model/car.dart';



class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({super.key, required this.car,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CardDetailsPage(car: car)));

      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5
      
          )
          ]
        ),
        child: Column(
          children: [
            Image.asset('assets/cardcar1.jpg',height: 220,),
            Text(car.model,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/pump.jpg',height: 20,),
                    Text('${car.distance.toStringAsFixed(0)}km'),
                    Row(
                      children: [
                        Image.asset('assets/pump.jpg',height: 20,),
                        Text('${car.fuelCapacity.toStringAsFixed(0)}L')
                      ],
                    )
                  ],
                ),
                Text('\$${car.pricePerHour.toStringAsFixed(2)}/h',style: TextStyle(fontSize:16 ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
