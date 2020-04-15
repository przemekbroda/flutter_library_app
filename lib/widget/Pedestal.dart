import 'package:flutter/material.dart';

class Pedestal extends CustomPainter {



  @override
  void paint(Canvas canvas, Size size) {
    var height = size.height / 18;
    var perspectiveHeight = height + height * 1.33;

    var rectPaint = Paint();
    rectPaint.color = Color.fromRGBO(224, 224, 226, 1.0);
    canvas.drawRect(Rect.fromCenter(center: Offset(size.width / 2, size.height - height / 2), width: size.width, height: height), rectPaint);

    var deepRectPaint = Paint();
    deepRectPaint.color = Color.fromRGBO(237, 237, 239, 1.0);
    deepRectPaint.style = PaintingStyle.fill;
    var deepRectPath = Path()
    ..moveTo(perspectiveHeight / 2, size.height - perspectiveHeight)
    ..lineTo(size.width - (perspectiveHeight / 2), size.height - perspectiveHeight)
    ..lineTo(size.width, size.height - height)
    ..lineTo(0, size.height - height);

    canvas.drawPath(deepRectPath, deepRectPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}