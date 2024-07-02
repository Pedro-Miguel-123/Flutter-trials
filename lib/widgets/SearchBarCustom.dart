// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SearchBarCustom extends StatelessWidget {
  final onValueChanged;

  const SearchBarCustom({super.key, required this.onValueChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: onValueChanged,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, size: 20),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
        ),
      ),
    );
  }
}
