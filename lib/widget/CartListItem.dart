import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/model/Book.dart';
import 'package:library_flutter_app/provider/CartProvider.dart';
import 'package:provider/provider.dart';

class CartListItem extends StatelessWidget {

  final Book book;

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
        onTap: () {},
        leading: Image.asset(book.cover),
        title: Text(book.title, style: GoogleFonts.abrilFatface(color: CustomColors.black),),
        subtitle: Text(book.author),
      ),
      background: Container(
        height: 230,
        width: double.infinity,
        color: Colors.red,
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete, color: Colors.white, size: 40,),
      ),
    );
  }
}
