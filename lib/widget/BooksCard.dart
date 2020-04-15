import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/widget/BookPedestal.dart';

import 'DotsIcon.dart';
import 'FillBar.dart';

class BooksCard extends StatelessWidget {

  final Function onDragUp;
  final Function onDragDown;


  BooksCard({@required this.onDragUp, @required this.onDragDown});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10
            ),
          ],
          borderRadius: BorderRadius.circular(46)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment(0,0),
              child: GestureDetector(
                onPanUpdate: (detail) {
                  if (detail.delta.dy > 0) {
                    onDragDown();
                  } else if (detail.delta.dy < 0) {
                    onDragUp();
                  }
                },
                child: Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 120, right: 120, top: 16, bottom: 20),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 5,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text('My books', style: GoogleFonts.abrilFatface(color: CustomColors.black, fontSize: 20),),
            SizedBox(height: 18,),
            Expanded(
              child: Row(
                children: <Widget>[
                  FittedBox(
                    child: Container(
                      width: 115,
                      height: 130,
                      child: BookPedestal(image: AssetImage('assets/images/justmytype.jpg'), bookBorderRadius: BorderRadius.circular(3), ),
                    ),
                  ),
                  SizedBox(width: 14,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Just My Type', style: GoogleFonts.abrilFatface(color: CustomColors.black, fontSize: 17),),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(4),
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                                      child: Container(
                                        height: 15,
                                        child: FittedBox(
                                          child: DotsIcon(dotsColor: Colors.grey.withOpacity(0.4),),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text('Simon Garfield', style: TextStyle(color: CustomColors.grayText),),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Return until 25.03.2020', style: TextStyle(color: CustomColors.yellowText),),
                            SizedBox(height: 8,),
                            Container(
                              width: 146,
                              child: FillBar(indicatorColor: CustomColors.yellowText, percent: 0.7,),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}