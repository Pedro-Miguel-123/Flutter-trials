import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/BuildAppBar.dart';
import 'package:to_do_app/widgets/NavigationDrawer.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: buildAppBar(),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
            const SizedBox(height: 24),
            Text(picture.name)
          ],
        )));
  }
}
