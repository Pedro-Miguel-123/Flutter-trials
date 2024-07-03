import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/BuildAppBar.dart';
import 'package:to_do_app/widgets/NavigationDrawer.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key, required this.picture});

  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: buildAppBar(context),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
            const SizedBox(height: 24),
            Text(picture.name),
            const SizedBox(height: 30),
            shareButton(),
            makeProfileButton()
          ],
        )));
  }

  TextButton makeProfileButton() {
    return TextButton.icon(
        onPressed: () {},
        label: const Text("Make profile picture"),
        icon: const Icon(
          Icons.account_circle,
          color: Colors.amberAccent,
        ));
  }

  TextButton shareButton() {
    return TextButton.icon(
      onPressed: () {
        shareFile(picture);
      },
      label: const Text("Share image"),
      icon: const Icon(
        Icons.share,
        color: Colors.amberAccent,
      ),
    );
  }

  static shareFile(XFile picture) {
    Share.shareFiles([picture.path], text: 'Check out this image!');
  }
}
