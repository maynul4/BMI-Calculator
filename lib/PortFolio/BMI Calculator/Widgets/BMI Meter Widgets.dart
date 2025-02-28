import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class bmiMeterWidget extends StatefulWidget {
  var BMI;
  var lightTheme;

   bmiMeterWidget({
    super.key, required this.BMI
     , required this.lightTheme
  });

  @override
  State<bmiMeterWidget> createState() => _bmiMeterWidgetState();
}

class _bmiMeterWidgetState extends State<bmiMeterWidget> {




  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.px,
      width: 300.px,
      decoration: BoxDecoration(
        // color: Color(0xff246AFE),
      ),
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            startAngle: 0,
            endAngle: 360,
            minimum: widget.BMI>=15?15:15,
            maximum: widget.BMI<=40?40:40,
            showLabels: false,
            showTicks: false,
            axisLineStyle: AxisLineStyle(
              thickness: 0.2.px,
              cornerStyle: CornerStyle.startCurve,
              color: Colors.grey.withOpacity(0.3),
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: widget.BMI,
                cornerStyle: CornerStyle.bothCurve,
                width: 0.2.px,
                sizeUnit: GaugeSizeUnit.factor,
                color: Color(0xff246AFE),
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  angle: 90,
                  positionFactor: 0.0,
                  widget: Text('${widget.BMI.toStringAsFixed(2)}',style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold, color: widget.lightTheme? Colors.black:Colors.white,  ),)
              ),
            ],
          ),
        ],
      ),
    );
  }
}


