import 'package:flutter/cupertino.dart';

class Pedestal extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {
    var height = 40.0;

    canvas.drawRect(Rect.fromCenter(center: Offset(0, size.width / 2), width: size.width, height: height), Paint());

    var deepRectPaint = Paint();
    deepRectPaint.style = PaintingStyle.fill;
    var deepRectPath = Path()
    ..moveTo(height, size.height - height * 3)
    ..lineTo(size.width - height, size.height - height * 3)
    ..lineTo(size.width, size.height - height)
    ..lineTo(0, size.height - height);

    canvas.drawPath(deepRectPath, deepRectPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}