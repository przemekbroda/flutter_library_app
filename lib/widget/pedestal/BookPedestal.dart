import 'package:flutter/material.dart';
import 'package:library_flutter_app/widget/pedestal/Pedestal.dart';



class BookPedestal extends StatelessWidget {

  final ImageProvider image;
  final Object heroTag;
  final BorderRadius bookBorderRadius;
  final bool pedestalFullWidth;

  const BookPedestal({Key key, @required this.image, this.bookBorderRadius, this.heroTag, this.pedestalFullWidth = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        CustomPaint(
          painter: Pedestal(),
        ),
        LayoutBuilder(
          builder: (_, constraints) => Align(
              alignment: Alignment(0, -1),
              child: ClipRRect(
                  borderRadius: bookBorderRadius ?? BorderRadius.circular(10),
                  child: heroTag != null ? Hero(tag: this.heroTag, child: generatedImage(constraints),) : generatedImage(constraints)
              ),
            ),
        )
      ],
    );
  }

  Widget generatedImage(BoxConstraints constraints) {
    return Image(
      image: image,
      fit: BoxFit.contain,
      height: constraints.maxHeight / 1.10,
    );
  }
}