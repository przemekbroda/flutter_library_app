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
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            SizedBox(width: 30,),
            leading ?? SizedBox(),
            Spacer(),
            center ?? SizedBox(),
            Spacer(),
            trailing ?? SizedBox(),
            SizedBox(width: 30,),
          ],
        ),
      ),
    );
  }
}
