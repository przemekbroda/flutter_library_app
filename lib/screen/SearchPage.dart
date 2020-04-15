import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/widget/CustomAppBar.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Column(
        children: <Widget>[
          CustomAppBar(
            center: Text('Search', style: GoogleFonts.abrilFatface(fontSize: 18),),
          ),
        ],
      ),
    );
  }
}
