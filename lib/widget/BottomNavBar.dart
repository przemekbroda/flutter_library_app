import 'package:flutter/material.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/provider/NavigationProvider.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

import 'Badge.dart';

class BottomNavBar extends StatefulWidget {

  final double navbarHeight;
  final double borderRadius;
  final Function onCurrentIndex;


  BottomNavBar({@required this.onCurrentIndex, @required this.navbarHeight, @required this.borderRadius});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipBehavior: Clip.antiAlias,
      clipper: BottomNavBarClipper(borderRadius: widget.borderRadius),
      child: Container(
        height: widget.navbarHeight,
        alignment: Alignment(0, 0.5),
        decoration: BoxDecoration(
          color: CustomColors.black,
        ),
        width: MediaQuery.of(context).size.width,
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentIndex,
          backgroundColor: CustomColors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 11,
          selectedLabelStyle: TextStyle(),
          unselectedFontSize: 11,
          onTap: (index) {
            setState(() {_currentIndex = index;});
            Provider.of<NavigationProvider>(context, listen: false).setCurrentPage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(height: 35, child: Icon(Icons.home)),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Container(height: 35, child: Icon(Icons.search)),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Container(height: 35, child: Icon(Icons.book)),
              title: Text('Library'),
            ),
            BottomNavigationBarItem(
              icon: Badge(child: Icon(Icons.shopping_cart), value: '1', color: Colors.amber,),
              title: Text('Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {

  final double borderRadius;

  BottomNavBarClipper({this.borderRadius});

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..arcToPoint(Offset(borderRadius, borderRadius), radius: Radius.circular(borderRadius), clockwise: false, rotation: math.pi)
      ..lineTo(size.width - borderRadius, borderRadius)
      ..arcToPoint(Offset(size.width, 0), clockwise: false, radius: Radius.circular(borderRadius), rotation: math.pi)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
