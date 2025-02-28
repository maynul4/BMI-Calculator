import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:untitled6/PortFolio/BMI%20Calculator/HomeScreen.dart';

import 'Widgets/BMI Meter Widgets.dart';
import 'Widgets/typingWidgets.dart';

class resultScreen extends StatefulWidget {
  late bool lightTheme;
  double BMI ;
  resultScreen({super.key, required this.lightTheme , required this.BMI });

  @override
  State<resultScreen> createState() => _resultScreenState();
}

class _resultScreenState extends State<resultScreen> {
  late bool lightTheme = widget.lightTheme;
  late double BMI = widget.BMI;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightTheme ? Color(0xffD1D9E6) : Color(0xff373737),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.px,),
          // Back Button
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => bmiCalHomeScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: lightTheme ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Your BMI is', style: TextStyle(fontSize: 24.px, fontWeight: FontWeight.bold, color: Color(0xff246AFE)),),
              ),
            ],
          ),
          SizedBox(height: 40.px),
          bmiMeterWidget(BMI: BMI, lightTheme: lightTheme, ),
          SizedBox(height: 20.px),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(classification(BMI).toString(),style: TextStyle(fontSize: 30.px, fontWeight: FontWeight.bold, color: Color(0xff246AFE)),)
          ],),

          SizedBox(height: 30.px,),

          Container(
            width: 330,
            decoration: BoxDecoration(
              color: lightTheme? Colors.white:Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: typingTextWidegts( lightTheme: lightTheme , Initailvalue: 'Your BMI is ${BMI.toStringAsFixed(2)}. ${ComlimentoryText(BMI)}')
          )






        ],
      ),
    );
  }
}


classification(BMI){
  if(BMI<18.50){
    return 'Underweight';
  } else if(BMI>= 18.51 && BMI<=24.99){
    return 'Normal weight';
  }else if(BMI>= 25 && BMI<=29.99){
    return 'Moderate obesity';
  }else if(BMI>= 30 && BMI<=34.99){
    return 'Severe obesity';
  }else if(BMI>= 35 ){
    return 'Very severe obesity';
  }
}
ComlimentoryText(BMI){
  if(BMI<18.5){
    return "Oops! 😮 Your BMI is lower than the recommended range. This might mean you're underweight. Consider consulting a nutritionist to improve your diet and gain healthy weight. Hey there! You might need some extra snacks and gains to match your height. Time for some delicious calories!";
  } else if(BMI>= 18.51 && BMI<=24.9){
    return "Great job! 🎉 Your BMI falls within the normal range, meaning your weight is healthy for your height. Keep up the balanced diet and regular activity! You're rocking it! BMI says you're in the perfect spot — healthy, happy, and fabulous! ";
  }else if(BMI>= 25 && BMI<=29.99){
    return "Heads up! 📊 Your BMI indicates you are slightly overweight. Small lifestyle changes like balanced meals and regular exercise can help bring your BMI into the healthy zone. A bit on the heavier side — but don’t worry! A few tweaks in the kitchen and some dance moves can fix this!";
  }else if(BMI>= 30 && BMI<=34.99){
    return "Important Alert! 🚨 Your BMI is in the obese range, which can increase health risks. It's a good idea to consult with a doctor or dietitian for a personalized health plan. BMI says we need to have a serious talk with your fridge! Let's plan some healthy goals together.";
  }else if(BMI>= 35 ){
    return 'Very severe obesity. your going to die😬😬. your should control yourself';
  }

}






