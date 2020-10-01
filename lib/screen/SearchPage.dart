import 'dart:ui';

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
      appBar: CustomAppBar(
        center: Text('Search', style: GoogleFonts.abrilFatface(fontSize: 18, color: CustomColors.black),),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("Click here"),
              onPressed: () {
                showBottomThingy();
              },
            ),
            SizedBox(height: 30,),
            SelectableText(
              "hjkasdhasdjk hasjkdsajk hsadujk",
              toolbarOptions: ToolbarOptions(
                copy: true,
                selectAll: true
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showBottomThingy() {
    showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    "asdasd",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                ),
                height: 50,
                width: double.infinity,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    Container(
                      color: Colors.redAccent,
                      height: 75,
                      width: double.infinity,
                    ),
                    Container(
                      color: Colors.amber,
                      height: 75,
                      width: double.infinity,
                    ),
                    Container(
                      color: Colors.deepPurple,
                      height: 75,
                      width: double.infinity,
                    ),
                    Container(
                      color: Colors.deepOrange,
                      height: 75,
                      width: double.infinity,
                    ),
                    Container(
                      color: Colors.indigo,
                      height: 75,
                      width: double.infinity,
                    ),
                    Container(
                      color: Colors.greenAccent,
                      height: 75,
                      width: double.infinity,
                    ),
                    Container(
                      color: Colors.blue,
                      height: 75,
                      width: double.infinity,
                    ),
                    Container(
                      color: Colors.brown,
                      height: 75,
                      width: double.infinity,
                    ),
                    Container(
                      color: Colors.cyan,
                      height: 75,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.white.withOpacity(0.01),
      transitionDuration: Duration(milliseconds: 400),
      transitionBuilder: (_, anim1, __, child ) {
        var offsetAnim = Tween<Offset>(
          begin: Offset(0, 1),
          end: Offset(0, 1 - (MediaQuery.of(context).size.height - 80) / MediaQuery.of(context).size.height),
        ).animate(CurvedAnimation(
          curve: Curves.decelerate,
          parent: anim1
        ));

        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY:  4 * anim1.value),
          child: SlideTransition(
            child: child,
            position: offsetAnim,
          ),
        );
      }
    );
  }
}

