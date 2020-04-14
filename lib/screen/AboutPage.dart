import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/widget/BlackButton.dart';
import 'package:library_flutter_app/widget/CustomAppBar.dart';
import 'package:library_flutter_app/widget/DotsAndFillBar.dart';

class AboutPage extends StatelessWidget {
  static const routeName = '/aboutPage';

  @override
  Widget build(BuildContext context) {
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
              child: Icon(Icons.arrow_back, size: 25,),
            ),
            trailing: Text(
              'Skip',
              style: GoogleFonts.abrilFatface(color: CustomColors.grayText, fontSize: 18),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Container(
                      width: double.infinity,
                      height: 315,
                      child: Image.asset('assets/images/library.png', fit: BoxFit.contain,),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      'Keep your books organized',
                      style: GoogleFonts.abrilFatface(
                        fontSize: 35,
                        color: CustomColors.black,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      'In the application you can book a book and get it in our library',
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 0.4,
                        fontSize: 16,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 70,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 53,
                          child: DotsAndFillBar(),
                        ),
                        Container(
                          width: 100,
                          child: BlackButton(
                            child: Text(
                              'Next',
                              style: TextStyle(color: Colors.white, fontSize: 17, letterSpacing: 0.5),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
