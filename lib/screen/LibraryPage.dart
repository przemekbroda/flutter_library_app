import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';

import 'file:///E:/Projekty/Flutter/library_flutter_app/lib/widget/appbar/CustomAppBar.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Column(
        children: <Widget>[
          CustomAppBar(
            center: Text('Library', style: GoogleFonts.abrilFatface(fontSize: 18),),
          )
        ],
      ),
    );
  }
}
