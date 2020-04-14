import 'package:flutter/material.dart';
import 'package:library_flutter_app/helper/CustomColors.dart';

class BoxesIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: weirdBox
              ),
              Expanded(
                child: weirdBox
              )
            ],),
          ),
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: weirdBox
              ),
              Expanded(
                child: FittedBox(child: Icon(Icons.map, size: 200,)),
              ),
            ],),
          )
        ],),
      ),
    );
  }

  Widget get weirdBox {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.black,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: CustomColors.backgroundColor, width: 7)
            ),
          ),
        ),
      ),
    );
  }
}
