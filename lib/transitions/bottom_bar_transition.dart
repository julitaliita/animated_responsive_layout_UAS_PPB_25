import 'package:flutter/material.dart';
import '../animations.dart';

class BottomBarTransition extends StatelessWidget {
  const BottomBarTransition({
    super.key,
    required this.animation,
    required this.child,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      axisAlignment: -1,
      child: FadeTransition(opacity: animation, child: child),
    );
  }
}