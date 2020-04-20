import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  final Widget center;
  final Widget trailing;
  final Widget leading;

  CustomAppBar({this.leading, this.center, this.trailing});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Container(
        height: 60,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            children: <Widget>[
              Align(alignment: Alignment.centerLeft, child: leading ?? SizedBox()),
              Align(alignment: Alignment.center, child: center ?? SizedBox()),
              Align(alignment: Alignment.centerRight, child: trailing ?? SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
