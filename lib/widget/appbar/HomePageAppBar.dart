import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';

import '../icons/BoxesIcon.dart';

class HomePageAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentDate = new DateTime.now();

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
            SizedBox(
              height: 50,
              child: Row(
                children: <Widget>[
                  Text(DateFormat.d().format(currentDate), style: GoogleFonts.abrilFatface(fontSize: 40, color: CustomColors.black),),
                  SizedBox(width: 10,),
                  Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                    Text(DateFormat.E().format(currentDate), style: GoogleFonts.abrilFatface(color: CustomColors.grayText),),
                    Text(DateFormat('MMMM y').format(currentDate), style: GoogleFonts.abrilFatface(color: CustomColors.grayText,),),
                  ],),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(children: <Widget>[
                Container(
                  width: 18,
                  height: 18,
                  child: FittedBox(
                    child: BoxesIcon(),
                  ),
                ),
                SizedBox(width: 18,),
                Container(
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 41,
                      width: 41,
                      child: Image.asset('assets/images/vader.jpeg', fit: BoxFit.cover,),
                    ),
                  ),
                )
              ],),
            )
          ],),
        ),
      ),
    );
  }
}
