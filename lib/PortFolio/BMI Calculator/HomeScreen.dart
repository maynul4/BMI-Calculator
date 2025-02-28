import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled6/PortFolio/BMI%20Calculator/resultScreen.dart';

class bmiCalHomeScreen extends StatefulWidget {
  const bmiCalHomeScreen({super.key});

  @override
  State<bmiCalHomeScreen> createState() => _bmiCalHomeScreenState();
}

class _bmiCalHomeScreenState extends State<bmiCalHomeScreen> {
  bool lightTheme = true;
  bool male = true;
  double height = 4.5;
  int weight = 50;
  int age  = 25;
  double  bmi = 0;


  calBmi() {

    setState(() {
      bmi = weight / ((height*0.0254)*(height*0.0254));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightTheme ? Color(0xffD1D9E6) : Color(0xff373737),
      body: Column(
        children: [
          SizedBox(height: 30.px),
          //Changing Theme color
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40.px,
                width: 100.px,
                decoration: BoxDecoration(
                  color: lightTheme ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          lightTheme = true;
                        });
                      },
                      icon: Icon(
                        Icons.sunny,
                        color: lightTheme ? Colors.blue : Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          lightTheme = false;
                        });
                      },
                      icon: Icon(
                        Icons.dark_mode,
                        color: lightTheme ? Colors.grey : Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30.px),

          //Welcome Message;
          Row(
            children: [
              SizedBox(width: 5),
              Text(
                'Welcome 😊',
                style: TextStyle(
                  color: lightTheme ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 5),
              Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: lightTheme ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),

          SizedBox(height: 30.px),

          //Select male or female
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    male = true;
                  });
                },
                child: Container(
                  height: 50.px,
                  width: 165.px,
                  decoration: BoxDecoration(
                    color: male ? Color(0xff246AFE) : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Male',
                      style: TextStyle(
                        fontSize: 20.px,
                        color: male ? Colors.white : Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    male = false;
                  });
                },
                child: Container(
                  height: 50.px,
                  width: 165.px,
                  decoration: BoxDecoration(
                    color: male ? Colors.white : Color(0xff246AFE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Female',
                      style: TextStyle(
                        fontSize: 20.px,
                        color: male ? Color(0xff246AFE) : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.px),



          //Height Wight and Age section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Height'),
                  Container(
                    // margin: EdgeInsets.only(left: 10.px),
                    height: 440.px,
                    width: 150.px,
                    decoration: BoxDecoration(
                      color: lightTheme? Colors.white: Colors.black12,
                      // color: Color(0xff246AFE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    //height section
                    child: Container(
                      padding: EdgeInsets.only(left: 10.px),
                      height: 440,
                      width: 10,
                    
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              showValueIndicator: ShowValueIndicator.always,
                              activeTrackColor: Color(0xff246AFE),
                              thumbColor: Colors.blue,
                              overlayColor: Color(0xff246AFE).withOpacity(0.2),
                              trackHeight: 30,
                              valueIndicatorColor: lightTheme?Color(0xff246AFE):Colors.white,
                              valueIndicatorTextStyle: TextStyle(color: lightTheme?Colors.white: Colors.black)
                            ),
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: Slider(
                                value: height,
                                min: 1,
                                max: 108,
                                label: (height / 12).toStringAsFixed(1),
                                onChanged: (value) {
                                  return setState(() {
                                    height = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.symmetric(vertical: 20.px),
                            height: 440,
                            width: 80,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                10,
                                (index) => Row(
                                  children: [
                                    Container(
                                      height: 2.px,
                                      width: 40.px,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      ' ${9 - index++}',
                                      style: TextStyle(
                                        color: lightTheme? Colors.black: Colors.white ,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Weight & age section
              Column(
                children: [
                  Text(''),
                  Container(
                    // margin: EdgeInsets.only(left: 10.px),
                    height: 440.px,
                    width: 170.px,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Weight section

                        Container( height: 210,
                          width: 170,
                          decoration: BoxDecoration(
                            color: lightTheme? Colors.white:Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Weight',style: TextStyle(fontSize: 15,color: lightTheme? Colors.black:Colors.white),),
                              SizedBox(height: 10,),
                              Text('${weight}',style: TextStyle(fontSize: 50,color: lightTheme? Colors.black:Colors.white),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                ElevatedButton(onPressed: (){ setState(() {
                                  weight = weight+1 ;
                                  print(weight);
                                }); }, child: Icon(Icons.add,color: Colors.white,),style: elevatedButtobStyle(),),
                                ElevatedButton(onPressed: (){
                                  setState(() {
                                    weight = weight-1;
                                  });
                                }, child: Text('-',style: TextStyle(color: Colors.white,fontSize: 20),),style: elevatedButtobStyle(),),
                              ],)
                            ],
                          ) ,
                        ),

                        // Age section
                        Container( height: 210,
                          width: 170,
                          decoration: BoxDecoration(
                            color: lightTheme? Colors.white:Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Age',style: TextStyle(fontSize: 15,color: lightTheme? Colors.black:Colors.white),),
                              SizedBox(height: 10,),
                              Text('${age}',style: TextStyle(fontSize: 50,color: lightTheme? Colors.black:Colors.white),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(onPressed: (){ setState(() {
                                    age ++;
                                  }); }, child: Icon(Icons.add,color: Colors.white,),style: elevatedButtobStyle(),),
                                  ElevatedButton(onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  }, child: Text('-',style: TextStyle(color: Colors.white,fontSize: 20),),style: elevatedButtobStyle(),),
                                ],)
                            ],
                          ) ,
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.px,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( height: 40.px, width: 330.px, child: ElevatedButton(onPressed: (){
                calBmi();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>resultScreen(lightTheme: lightTheme, BMI: bmi, )));
              }, child: Text('Let\'s go', style: TextStyle(fontSize: 20,color: Colors.white),),style: elevatedButtobStyle(),))
            ],
          )
        ],
      ),
    );
  }
}


elevatedButtobStyle(){
 return ElevatedButton.styleFrom(
    backgroundColor: Color(0xff246AFE),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
