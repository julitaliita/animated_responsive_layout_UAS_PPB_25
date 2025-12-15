import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  static final searchKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: searchKey,
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        hintText: 'Search mail',
        leading: const Icon(Icons.search),
      ),
    );
  }
}