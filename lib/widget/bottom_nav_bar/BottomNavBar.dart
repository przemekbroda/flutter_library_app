import 'package:flutter/material.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/provider/NavigationProvider.dart';
import 'package:provider/provider.dart';

import '../Badge.dart';

class BottomNavBar extends StatefulWidget {
  final double navbarHeight;
  final double borderRadius;
  final Function onCurrentIndex;

  BottomNavBar(
      {@required this.onCurrentIndex,
      @required this.navbarHeight,
      @required this.borderRadius});

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
        height: widget.navbarHeight + MediaQuery.of(context).padding.bottom,
        alignment: Alignment(0, 0.75),
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
            setState(() {
              _currentIndex = index;
            });
            Provider.of<NavigationProvider>(context, listen: false)
                .setCurrentPage(index);
          },
          items: [
            getNavBarItem(Icon(Icons.home), Text('Home')),
            getNavBarItem(Icon(Icons.search), Text('Search')),
            getNavBarItem(Icon(Icons.book), Text('Library')),
            getNavBarItem(
                Badge(child: Icon(Icons.shopping_cart), color: Colors.amber),
                Text('Cart')),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem getNavBarItem(Widget icon, Text text) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Container(height: 30, child: icon),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: text,
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
      ..arcToPoint(Offset(borderRadius, borderRadius),
          radius: Radius.circular(borderRadius),
          clockwise: false,
      )
      ..lineTo(size.width - borderRadius, borderRadius)
      ..arcToPoint(Offset(size.width, 0),
          clockwise: false,
          radius: Radius.circular(borderRadius),
      )
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
