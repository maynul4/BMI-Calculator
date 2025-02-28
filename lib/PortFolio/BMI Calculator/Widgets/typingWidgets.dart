import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class typingTextWidegts extends StatefulWidget {

  final String Initailvalue;
  final bool  lightTheme;

   typingTextWidegts({
    super.key,
     required this.Initailvalue,
     required this.lightTheme
  });

  @override
  State<typingTextWidegts> createState() => _typingTextWidegtsState();
}

class _typingTextWidegtsState extends State<typingTextWidegts> {

  late String initialText =  widget.Initailvalue;
  String displayText = '';
  int index = 0;
  Timer? timer;
  void StartTyping (){
    timer = Timer.periodic(Duration(milliseconds: 50), (timer){
      if(index < initialText.length) {
        setState(() {
          displayText += initialText[index];
          index++;
        });
      }else{
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StartTyping();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(displayText,style: TextStyle(fontSize: 15 , color: widget.lightTheme? Colors.black:Colors.white, ),overflow: TextOverflow.ellipsis, maxLines: 10, ),
    );
  }
}
