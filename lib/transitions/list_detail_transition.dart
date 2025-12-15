import 'package:flutter/material.dart';
import '../animations.dart';

class ListDetailTransition extends StatelessWidget {
  const ListDetailTransition({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kAnimationDuration,
      switchInCurve: kAnimationCurve,
      switchOutCurve: kAnimationCurve,
      child: child,
    );
  }
}
