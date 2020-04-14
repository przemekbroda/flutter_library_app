import 'package:flutter/material.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';

import 'FillBar.dart';

class DotsAndFillBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _dot(),
        SizedBox(width: 10,),
        _dot(),
        SizedBox(width: 8,),
        Expanded(
          child: FillBar(
            indicatorColor: CustomColors.yellowText,
            percent: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _dot() {
    return Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.grey.withOpacity(0.5),
        ),
      );
  }
}
