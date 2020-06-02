import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/widget/appbar/CustomAppBar.dart';


class SearchPage extends StatefulWidget {

  SearchPage({key: Key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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

