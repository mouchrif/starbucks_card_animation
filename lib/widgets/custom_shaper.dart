import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
  Paint paint_0 = new Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*0.4950495,size.height*0.0990099);
    path_0.quadraticBezierTo(size.width*0.2067327,size.height*0.4091089,size.width*0.1980198,size.height*0.5940594);
    path_0.cubicTo(size.width*0.1961386,size.height*0.6817822,size.width*0.2029703,size.height*0.8867327,size.width*0.4950495,size.height*0.8910891);
    path_0.cubicTo(size.width*0.7981188,size.height*0.8918812,size.width*0.7945545,size.height*0.6817822,size.width*0.7920792,size.height*0.5940594);
    path_0.quadraticBezierTo(size.width*0.7833663,size.height*0.4069307,size.width*0.4950495,size.height*0.0990099);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
