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
    return AppBar(
      automaticallyImplyLeading: true,
      elevation: 0,
      backgroundColor: CustomColors.backgroundColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: leading ?? SizedBox(),
      ),
      title: center ?? SizedBox(),
      actions: <Widget>[Padding(
        padding: const EdgeInsets.only(right: 15),
        child: trailing ?? SizedBox(),
      )],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize {
    return Size(_appbarWidth, _appbarHeight);
  }


}
