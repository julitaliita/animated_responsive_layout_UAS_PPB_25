import 'package:flutter/material.dart';
import '../animations.dart';

class NavRailTransition extends StatelessWidget {
  const NavRailTransition({
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
      axis: Axis.horizontal,
      axisAlignment: -1,
      child: FadeTransition(opacity: animation, child: child),
    );
  }
}