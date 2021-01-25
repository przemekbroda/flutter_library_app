import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/widget/icons/BoxesIcon.dart';


class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {

  final double _appbarHeight = 60.0;
  final double _appbarWidth = double.infinity;

  @override
  Widget build(BuildContext context) {
    var currentDate = new DateTime.now();

    return SafeArea(
          child: Container(
        color: CustomColors.backgroundColor,
        child: Container(
          width: _appbarWidth,
          height: _appbarHeight,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            Row(
              children: <Widget>[
                Text(DateFormat.d().format(currentDate), style: GoogleFonts.abrilFatface(fontSize: 40, color: CustomColors.black),),
                SizedBox(width: 10,),
                Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  Text(DateFormat.E().format(currentDate), style: GoogleFonts.abrilFatface(color: CustomColors.grayText),),
                  Text(DateFormat('MMMM y').format(currentDate), style: GoogleFonts.abrilFatface(color: CustomColors.grayText,),),
                ],),
              ],
            ),
            Row(children: <Widget>[
              Container(
                width: 18,
                height: 18,
                child: FittedBox(
                  child: BoxesIcon(),
                ),
              ),
              SizedBox(width: 18,),
              Container(
                width: 41,
                height: 41,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      color: Colors.black.withOpacity(0.30),
                      offset: Offset(0, 4)
                    ),
                  ]
                ),
                child: Image.asset('assets/images/vader.jpeg', fit: BoxFit.cover,),
              )
            ],)
          ],),
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size(double.infinity, _appbarHeight);
  }


}
