import 'package:build_car_rental_app_flutter/pressentation/pages/maps_details_page.dart';
import 'package:build_car_rental_app_flutter/pressentation/widgets/car_card.dart';
import 'package:build_car_rental_app_flutter/pressentation/widgets/more_card.dart';
import 'package:flutter/material.dart';

import '../../data/model/car.dart';







class CardDetailsPage extends StatefulWidget {
  final Car car;

  const CardDetailsPage({super.key, required this.car});

  @override
  State<CardDetailsPage> createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this);
    _animation = Tween<double>(begin:1.0, end:  2.5 ).animate(_controller!)
    ..addListener((){ setState(() {

    }); });

    _controller!.forward();
    super.initState();
  }
  @override
  void dispose() {
     _controller!.forward();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar (
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline),
          Text('Information')
        ],
      ),
      ),
      body: Column(
        children: [
          CarCard(car: Car(model: widget.car.model, distance: widget.car.distance, fuelCapacity: widget.car.fuelCapacity, pricePerHour: widget.car.pricePerHour)),
          SizedBox(height: 10,),
         Row(
           children: [
             Expanded(
             child: Container(
              padding: EdgeInsets.all(20),
               decoration: BoxDecoration(
                   color: Color(0xffF3F3F3),
                   borderRadius: BorderRadius.circular(20),
                   boxShadow: [BoxShadow(
                     color: Colors.black12,
                     blurRadius: 10,
                     spreadRadius: 5,
                   )]
               ),
               child: Column(
                 children: [
                   CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/user2.jpg'),),
                   SizedBox(height: 5,),
                   Text('Jane Cooper',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                   SizedBox(height: 10,),
                   Text('\$4,253',style: TextStyle(color: Colors.grey),),
                 ],
               ),
             ),
           ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 8),
             ),
             Expanded(
               child: GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>MapsDetailsPage(car: widget.car)));
                 },
                 child: Container(
                   height: 205,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       boxShadow: [BoxShadow(
                         color: Colors.black12,
                         blurRadius: 10,
                         spreadRadius: 5,
                       ),
                       ]
                   ),
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(20),
                     child: Transform.scale(
                       scale: _animation!.value,
                       alignment: Alignment.center,
                       child: Image.asset(('assets/maps.png'), fit: BoxFit.cover),
                     ),
                   ),
                 ),
               ),
             )],
         ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                MoreCard(car: Car(model: widget.car.model+"-1", distance: widget.car.distance+100, fuelCapacity: widget.car.fuelCapacity+100, pricePerHour: widget.car.pricePerHour+10)),
                SizedBox(height: 3,),
                MoreCard(car: Car(model: widget.car.model+"-2", distance: widget.car.distance+200, fuelCapacity: widget.car.fuelCapacity+200, pricePerHour: widget.car.pricePerHour+20)),
                SizedBox(height: 3,),
                MoreCard(car: Car(model: widget.car.model+"-3", distance: widget.car.distance+300, fuelCapacity: widget.car.fuelCapacity+300, pricePerHour: widget.car.pricePerHour+30)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
