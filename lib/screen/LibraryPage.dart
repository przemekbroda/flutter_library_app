import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/widget/appbar/CustomAppBar.dart';


class LibraryPage extends StatelessWidget {

  LibraryPage({key: Key}) : super(key: key);

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
