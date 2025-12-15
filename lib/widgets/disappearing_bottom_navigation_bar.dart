import 'package:flutter/material.dart';
import '../animations.dart';
import '../transitions/bottom_bar_transition.dart';

class DisappearingBottomNavigationBar extends StatelessWidget {
  const DisappearingBottomNavigationBar({
    super.key,
    required this.isVisible,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
  });

  final bool isVisible;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<NavigationDestination> destinations;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kAnimationDuration,
      switchInCurve: kAnimationCurve,
      switchOutCurve: kAnimationCurve,
      child: isVisible
          ? BottomBarTransition(
              animation: const AlwaysStoppedAnimation(1),
              child: NavigationBar(
                selectedIndex: selectedIndex,
                onDestinationSelected: onDestinationSelected,
                destinations: destinations,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}