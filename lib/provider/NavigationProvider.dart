import 'package:flutter/cupertino.dart';
import 'package:library_flutter_app/screen/CartPage.dart';
import 'package:library_flutter_app/screen/HomePage.dart';
import 'package:library_flutter_app/screen/LibraryPage.dart';
import 'package:library_flutter_app/screen/SearchPage.dart';

class NavigationProvider with ChangeNotifier {

  var pageIndex = 0;

  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    LibraryPage(),
    CartPage(),
  ];

  void setCurrentPage(pageIndex) {
    if (pageIndex > pages.length - 1) {
      pageIndex = pages.length - 1;
    } else {
      this.pageIndex = pageIndex;
    }
    notifyListeners();
  }

  Widget get currentPage {
    return pages[pageIndex];
  }

}