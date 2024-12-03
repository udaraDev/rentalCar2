import 'package:build_car_rental_app_flutter/pressentation/pages/car_list_screen.dart';
import 'package:build_car_rental_app_flutter/pressentation/pages/login.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2c2B30),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/onboardingcar2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Premiom cars. \nEnjoy the luxury',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Premiom and prestige car daily rental. \nExperience the thrill at lower price',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 320,
                    height: 54,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                              (route) => false);
                          // Navigator.push
                          //   (context, MaterialPageRoute(builder: (context)=>
                          //     CarListScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          'Let\'s Go',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
