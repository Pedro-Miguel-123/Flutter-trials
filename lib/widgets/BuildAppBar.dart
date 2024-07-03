// ignore_for_file: file_names
import 'package:flutter/material.dart';

/// TODO: Try and make this a StatefulWidget to be able to have a class and change the themes
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/avatar.jpeg'),
          ),
        )
      ],
    ),
  );
}
