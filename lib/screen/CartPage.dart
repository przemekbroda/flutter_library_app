import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/provider/CartProvider.dart';
import 'package:library_flutter_app/widget/appbar/CustomAppBar.dart';
import 'package:library_flutter_app/widget/list_item/CartListItem.dart';
import 'package:provider/provider.dart';



class CartPage extends StatefulWidget {

  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    print("build ");
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Center(
        child: Column(
          children: <Widget>[
            CustomAppBar(
              center: Text('Your Cart', style: GoogleFonts.abrilFatface(fontSize: 18),),
            ),
            Expanded(
              child: Consumer<CartProvider>(
                builder: (_, provider, ___) => ListView.separated(
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: provider.cart.length,
                  itemBuilder: (_, index) => CartListItem(book: provider.cart.values.toList()[index],)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
