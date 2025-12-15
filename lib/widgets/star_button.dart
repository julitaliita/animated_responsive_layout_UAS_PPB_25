import 'package:flutter/material.dart';

class StarButton extends StatefulWidget {
  const StarButton({super.key});

  @override
  State<StarButton> createState() => _StarButtonState();
}
class _StarButtonState extends State<StarButton> {
  bool isStarred = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Icon(
          isStarred ? Icons.star : Icons.star_border,
          key: ValueKey(isStarred),
          color: Colors.amber,
        ),
      ),
      onPressed: () {
        setState(() {
          isStarred = !isStarred;
        });
      },
    );
  }
}