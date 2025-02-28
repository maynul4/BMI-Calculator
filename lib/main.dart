import 'package:flutter/material.dart';
import 'PortFolio/BMI Calculator/HomeScreen.dart';
import 'package:sizer/sizer.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
   return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(home: bmiCalHomeScreen(), debugShowCheckedModeBanner: false,);
      },
    );






  }
}
