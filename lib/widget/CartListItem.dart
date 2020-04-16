import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/model/Book.dart';
import 'package:library_flutter_app/provider/CartProvider.dart';
import 'package:library_flutter_app/screen/BookDetailPage.dart';
import 'package:provider/provider.dart';

class CartListItem extends StatelessWidget {
  final Book book;
  final booksDetailHeroSuffix = 'cart';

  const CartListItem({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(book.id),
      direction: DismissDirection.endToStart,
      onDismissed: (dir) {
        Provider.of<CartProvider>(context, listen: false).removeFromCart(book);
      },
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(BookDetailPage.routeName, arguments: {
            'bookId': book.id,
            'heroSuffix': booksDetailHeroSuffix
          });
        },
        leading: Hero(
          tag: '${book.cover}$booksDetailHeroSuffix',
          child: Image.asset(book.cover),
        ),
        title: Hero(
          tag: '${book.title}$booksDetailHeroSuffix',
          child: Material(
            color: Colors.transparent,
            child: Text(
              book.title,
              style: GoogleFonts.abrilFatface(color: CustomColors.black),
            ),
          ),
        ),
        subtitle: Hero(
          tag: '${book.author}$booksDetailHeroSuffix',
          child: Material(
            color: Colors.transparent,
            child: Text(book.author),
          ),
        ),
      ),
      background: Container(
        height: 230,
        width: double.infinity,
        color: Colors.red,
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
