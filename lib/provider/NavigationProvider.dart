import 'package:flutter/cupertino.dart';
import 'package:library_flutter_app/screen/CartPage.dart';
import 'package:library_flutter_app/screen/HomePage.dart';

class NavigationProvider with ChangeNotifier {

  var pageIndex = 0;

  List<Widget> pages = [
    HomePage(),
    CartPage(),
  ];

  void setCurrentPage(pageIndex) {
    if (pageIndex > pages.length - 1) {
      pageIndex = 1;
    } else {
      this.pageIndex = pageIndex;
    }
    notifyListeners();
  }

  Widget get currentPage {
    return pages[pageIndex];
  }

}