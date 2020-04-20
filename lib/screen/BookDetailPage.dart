import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/provider/BooksProvider.dart';
import 'package:library_flutter_app/provider/CartProvider.dart';
import 'package:library_flutter_app/widget/FillBar.dart';
import 'package:library_flutter_app/widget/pedestal/BookPedestal.dart';
import 'package:provider/provider.dart';

import 'file:///E:/Projekty/Flutter/library_flutter_app/lib/widget/appbar/CustomAppBar.dart';
import 'file:///E:/Projekty/Flutter/library_flutter_app/lib/widget/button/BlackButton.dart';
import 'file:///E:/Projekty/Flutter/library_flutter_app/lib/widget/icons/DotsIcon.dart';

class BookDetailPage extends StatelessWidget {
  static const routeName = '/bookDetailPage';

  @override
  Widget build(BuildContext context) {
    var arguments = (ModalRoute.of(context).settings.arguments as Map<String, dynamic>);
    var bookId = arguments['bookId'] as int;
    var heroSuffix = arguments['heroSuffix'];

    var book = Provider.of<BooksProvider>(context, listen: false).getBookById(bookId);

    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Column(
        children: <Widget>[
          CustomAppBar(
            leading: InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                size: 25,
              ),
            ),
            trailing: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                child: Container(
                  height: 15,
                  child: FittedBox(
                    child: DotsIcon(
                      dotsColor: CustomColors.black,
                    ),
                  ),
                ),
              ),
            ),
            center: Text(
              'Detail Book',
              style: GoogleFonts.abrilFatface(fontSize: 18),
            ),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: CustomColors.backgroundColor,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 325,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: BookPedestal(
                          image: AssetImage(book.cover),
                          heroTag: '${book.cover}$heroSuffix',
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Hero(
                        tag: '${book.title}$heroSuffix',
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            book.title,
                            style: GoogleFonts.abrilFatface(
                                fontSize: 24, letterSpacing: 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Hero(
                        tag: '${book.author}$heroSuffix',
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            book.author,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: FillBar(
                              percent: 0.8,
                              indicatorColor: CustomColors.green,
                            ),
                            width: 100,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            '8 in Stock',
                            style: TextStyle(color: CustomColors.green),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        book.description,
                        style: TextStyle(
                            color: CustomColors.grayText,
                            letterSpacing: 0.4,
                            height: 1.6),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Container(
                          width: double.infinity,
                          child: BlackButton(onPressed: () {
                            var provider = Provider.of<CartProvider>(context,
                                listen: false);
                            if (provider.isInCart(book)) {
                              provider.removeFromCart(book);
                            } else {
                              provider.addToCart(book);
                            }
                          }, child:
                              Consumer<CartProvider>(builder: (_, cart, child) {
                            var isInCart = cart.isInCart(book);

                            return AnimatedSwitcher(
                              duration: Duration(milliseconds: 100),
                              child: Text(
                                cart.isInCart(book)
                                    ? 'Remove from cart'
                                    : 'Add to cart',
                                key: ValueKey(isInCart),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    letterSpacing: 0.5),
                              ),
                            );
                          }))),
                      SizedBox(
                        height: 45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
