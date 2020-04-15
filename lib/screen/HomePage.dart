import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/provider/BooksProvider.dart';
import 'package:library_flutter_app/widget/BooksCard.dart';
import 'package:library_flutter_app/widget/BooksListItem.dart';
import 'package:library_flutter_app/widget/HomePageAppBar.dart';
import 'package:provider/provider.dart';

import 'AboutPage.dart';
import 'BookDetailPage.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  AnimationController _animationController;
  Animation<double> _offsetAnimation;

  void onCardDragUp() {
    _animationController.forward();
  }

  void onCardDragDown() {
    _animationController.reverse();
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _offsetAnimation = Tween<double>(begin: 235, end: 0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BooksProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Stack(
        children: <Widget>[
          Column(children: <Widget>[
            HomePageAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('New arrivals', style: GoogleFonts.abrilFatface(fontSize: 21),),
                          InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              Navigator.of(context).pushNamed(AboutPage.routeName);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Row(children: <Widget>[
                                Text('View all', style: TextStyle(fontSize: 14, color: CustomColors.yellowText),),
                                SizedBox(width: 3,),
                                Icon(Icons.chevron_right, size: 18, color: CustomColors.yellowText,)
                              ],),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 320,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.books.length,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: index == 0 ? 30 : 15, right: index == provider.books.length - 1 ? 30 : 15),
                              child: Provider(
                                create: (ctx) => provider.books[index],
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(BookDetailPage.routeName, arguments: index);
                                    },
                                    child: BooksListItem(),
                                  ),
                                ),
                              )
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (ctx, child) => Transform.translate(
                offset: Offset(0, _offsetAnimation.value),
                child: Container(
                  height: 280,
                  width: double.infinity,
                  child: BooksCard(onDragDown: this.onCardDragDown, onDragUp: this.onCardDragUp,),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
