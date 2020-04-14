import 'package:flutter/material.dart';

class DotsIcon extends StatelessWidget {
  final Color dotsColor;

  DotsIcon({@required this.dotsColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _dot(),
          _dot(),
        ],
      ),
    );
  }

  Widget _dot() {
    return Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: dotsColor,
          borderRadius: BorderRadius.circular(100),
        ),
      );
  }
}
