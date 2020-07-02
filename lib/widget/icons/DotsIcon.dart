import 'package:flutter/material.dart';

class DotsIcon extends StatelessWidget {
  final Color dotsColor;

  DotsIcon({@required this.dotsColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
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
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          color: dotsColor,
          borderRadius: BorderRadius.circular(100),
        ),
      );
  }
}
