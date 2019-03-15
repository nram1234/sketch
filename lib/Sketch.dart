import 'package:flutter/material.dart';
class Sketch extends CustomPainter{
    List<Offset>ponits;

    Sketch(this.ponits);

    @override
  void paint(Canvas canvas, Size size) {
     Paint paint=Paint()..color=Colors.tealAccent
         ..strokeCap=StrokeCap.round
         ..strokeWidth=4.0;
     for(int i=0;i<ponits.length-1;i++){
       if(ponits[i]!=null&&ponits[i+1]!=null){
         canvas..drawLine(ponits[i], ponits[i+1], paint);
       }
     }
  }

  @override
  bool shouldRepaint(Sketch oldDelegate) {

    return oldDelegate.ponits !=ponits;
  }

}































