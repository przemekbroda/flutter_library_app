import 'package:flutter/material.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';

class BlackButton extends StatelessWidget {

  final Widget child;
  final Function onPressed;

  BlackButton({@required this.child, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19)),
      padding: EdgeInsets.symmetric(vertical: 20),
      onPressed: onPressed,
//      child: Text(
//        'Next',
//        style: TextStyle(color: Colors.white, fontSize: 17, letterSpacing:),
//      ),
    child: child,
      color: CustomColors.black,
    );
  }
}
