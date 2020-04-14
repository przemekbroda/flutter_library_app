import 'package:flutter/material.dart';

class FillBar extends StatelessWidget {

  final Color indicatorColor;
  final double percent;

  FillBar({@required this.indicatorColor, @required this.percent});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            Container(
              height: 7,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              width: constraints.maxWidth * percent,
              height: 6,
              decoration: BoxDecoration(
                color: indicatorColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        );
      }
    );
  }
}
