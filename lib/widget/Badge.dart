import 'package:flutter/material.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';
import 'package:library_flutter_app/provider/CartProvider.dart';
import 'package:provider/provider.dart';


class Badge extends StatelessWidget {

  final Widget child;
  final Color color;


  Badge({@required this.child, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          child,
          Align(
            alignment: Alignment(0.2, -0.8),
            child: Consumer<CartProvider>(
              builder: (_, cart, child) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  transitionBuilder: (widget, animation) => ScaleTransition(scale: animation, child: widget,),
                  child: cart.cart.length > 0 ? Container(
                    padding: EdgeInsets.all(2),
                    constraints: BoxConstraints(minHeight: 14, minWidth: 14),
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(cart.cart.length.toString(), style: TextStyle(color: CustomColors.black, fontSize: 8.5, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  ) : SizedBox(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
