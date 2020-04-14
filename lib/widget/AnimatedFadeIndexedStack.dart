import 'package:flutter/material.dart';


///Code from https://gist.github.com/diegoveloper/1cd23e79a31d0c18a67424f0cbdfd7ad
class AnimatedFadeIndexedStack extends StatefulWidget {
  final int index;
  final List<Widget> children;
  final Duration duration;

  const AnimatedFadeIndexedStack({Key key, @required this.index, this.duration = const Duration(milliseconds: 300), @required this.children}) : super(key: key);

  @override
  _AnimatedFadeIndexedStackState createState() => _AnimatedFadeIndexedStackState();
}

class _AnimatedFadeIndexedStackState extends State<AnimatedFadeIndexedStack> with TickerProviderStateMixin {
  
  AnimationController _controller;
  Animation<double> _opacityFirstAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _opacityFirstAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(curve: Curves.easeInOut, parent: _controller));

    super.initState();
  }
  
  @override
  void didUpdateWidget(AnimatedFadeIndexedStack oldWidget) {
    if (oldWidget.index != widget.index) {
      _controller.reverse(from: 1.0);
    }
    super.didUpdateWidget(oldWidget);
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) => Opacity(
        opacity: _opacityFirstAnimation.value,
        child: child,
      ),
      child: IndexedStack(
        index: widget.index,
        children: widget.children,
      ),
    );
  }
}
