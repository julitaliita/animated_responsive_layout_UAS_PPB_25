import 'package:flutter/material.dart';
import '../animations.dart';

class AnimatedFloatingActionButton extends StatelessWidget {
  const AnimatedFloatingActionButton({
    super.key,
    required this.isVisible,
    required this.onPressed,
  });

  final bool isVisible;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale( 
      duration: kAnimationDuration,
      scale: isVisible ? 1 : 0,
      child: FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
