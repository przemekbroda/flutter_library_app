import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/model/Book.dart';
import 'package:provider/provider.dart';

class BooksListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var book = Provider.of<Book>(context, listen: false);

    return Container(
      width: 132,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Hero(
              tag: book.cover,
              child: Image.asset(
                book.cover,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: book.title,
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        book.title,
                        style: GoogleFonts.abrilFatface(
                            color: CustomColors.black, fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Hero(
                    tag: book.author,
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        book.author,
                        style: TextStyle(
                            color: CustomColors.grayText,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
