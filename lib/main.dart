import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:library_flutter_app/provider/BooksProvider.dart';
import 'package:library_flutter_app/provider/CartProvider.dart';
import 'package:library_flutter_app/provider/NavigationProvider.dart';
import 'package:library_flutter_app/screen/AboutPage.dart';
import 'package:library_flutter_app/screen/BookDetailPage.dart';
import 'package:library_flutter_app/screen/MainPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (ctx) => BooksProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => NavigationProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
        routes: {
          BookDetailPage.routeName: (ctx) => BookDetailPage(),
          AboutPage.routeName:(ctx) => AboutPage(),
        },
      ),
    );
  }
}


