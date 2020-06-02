import 'package:flutter/material.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/provider/NavigationProvider.dart';
import 'package:library_flutter_app/widget/bottom_nav_bar/BottomNavBar.dart';
import 'package:provider/provider.dart';


class MainPage extends StatefulWidget {

  static const routeName = '/mainPage';


  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _bottomNavbarHeight = 135.0;
  final _bottomNavbarRadius = 46.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          width: double.infinity,
          color: CustomColors.backgroundColor,
          height: MediaQuery.of(context).size.height - _bottomNavbarHeight + _bottomNavbarRadius,
          child: Consumer<NavigationProvider>(
            builder: (_, nav, child) {
              return nav.pages[nav.pageIndex];
//              return AnimatedFadeIndexedStack(
//                index: nav.pageIndex,
//                children: nav.pages,
//              );
            },
          ),
        ),
        Align(
          alignment: Alignment(0, 1),
          child: BottomNavBar(onCurrentIndex: () {},navbarHeight: _bottomNavbarHeight, borderRadius: _bottomNavbarRadius)
        ),
      ],),
    );
  }
}

