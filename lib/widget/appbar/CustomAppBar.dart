import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final Widget center;
  final Widget trailing;
  final Widget leading;

  final double _appbarWidth = double.infinity;
  final double _appbarHeight = 60;

  CustomAppBar({this.leading, this.center, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.backgroundColor,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Container(
        height: _appbarHeight,
        width: _appbarWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
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

  @override
  Size get preferredSize {
    return Size(_appbarWidth, _appbarHeight);
  }


}
