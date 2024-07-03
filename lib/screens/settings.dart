import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/screens/camera_page.dart';
import 'package:to_do_app/screens/preview_page.dart';
import 'package:to_do_app/widgets/BuildAppBar.dart';
import 'package:to_do_app/widgets/NavigationDrawer.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: buildAppBar(context),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 70,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    _dialogBuilder(context);
                  },
                  icon: const Icon(
                    Icons.account_circle,
                    color: Colors.amberAccent,
                  ),
                  label: const Text("Change profile picture")),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.mode_edit_outline,
                    color: Colors.amberAccent,
                  ),
                  label: const Text("Change app theme")),
            ],
          ),
        ));
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Change Profile Picture'),
            content: const Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                  'Would you rather pick from your existing pictures, take a new one or pick from unsplashed?'),
            ]),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
                child: const Text('New'),
                onPressed: () async {
                  await availableCameras().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CameraPage(cameras: value))));
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Choose'),
                onPressed: () {
                  chooseImage(context);
                },
              )
            ],
          );
        });
  }

  Future chooseImage(BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PreviewPage(picture: image)));
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image $e');
    }
  }
}
