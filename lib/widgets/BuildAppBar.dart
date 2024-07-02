// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: tdBGColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
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
