import 'package:flutter/material.dart';
import '../animations.dart';
import '../transitions/nav_rail_transition.dart';

class DisappearingNavigationRail extends StatelessWidget {
  const DisappearingNavigationRail({
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
          ? NavRailTransition(
              animation: const AlwaysStoppedAnimation(1),
              child: NavigationRail(
                selectedIndex: selectedIndex,
                onDestinationSelected: onDestinationSelected,
                labelType: NavigationRailLabelType.all,
                destinations: destinations
                    .map(
                      (d) => NavigationRailDestination(
                        icon: d.icon,
                        selectedIcon: d.selectedIcon,
                        label: Text(d.label),
                      ),
                    )
                    .toList(),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}