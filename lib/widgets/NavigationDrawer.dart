// ignore_for_file: file_names

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/api_page.dart';
import 'package:to_do_app/screens/camera_page.dart';
import 'package:to_do_app/screens/home.dart';
import 'package:to_do_app/screens/settings.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const isCollapsed = false;

    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);
    return Drawer(
      child: Container(
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24).add(safeArea),
              width: double.infinity,
              color: Theme.of(context).colorScheme.onInverseSurface,
              child: buildHeader(context),
            ),
            SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30, left: 30),
                  ),
                  listItemHome(context),
                  listItemSettings(context),
                  listItemCamera(context),
                  listItemAPI(context)
                ],
              ),
            ),
            const Spacer(),
            buildCollapseIcon(context, isCollapsed),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(icon, color: Colors.black),
            const Padding(padding: EdgeInsets.only(right: 20))
          ],
        ),
        onTap: () {
          /**I'm not quite sure why this works to close the drawer 
           * but it does
          */
          isCollapsed = true;
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget listItemAPI(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => APIPage()));
      },
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.only(left: 10)),
          Icon(
            Icons.api,
            color: Theme.of(context).colorScheme.primary,
          ),
          const Padding(padding: EdgeInsets.only(left: 15)),
          const Text('API', style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }

  Widget listItemCamera(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        await availableCameras().then((value) => Navigator.push(context,
            MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
      },
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.only(left: 10)),
          Icon(
            Icons.camera,
            color: Theme.of(context).colorScheme.primary,
          ),
          const Padding(padding: EdgeInsets.only(left: 15)),
          const Text(
            'Camera',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }

  //Home button
  Widget listItemHome(BuildContext context) => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.only(left: 10)),
          Icon(
            Icons.home,
            color: Theme.of(context).colorScheme.primary,
          ),
          const Padding(padding: EdgeInsets.only(left: 15)),
          const Text(
            'Home',
            style: TextStyle(fontSize: 20),
          )
        ],
      ));

  //Settings Button
  Widget listItemSettings(BuildContext context) => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Settings()));
      },
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.only(left: 10)),
          Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.primary,
          ),
          const Padding(padding: EdgeInsets.only(left: 15)),
          const Text(
            'Settings',
            style: TextStyle(fontSize: 20),
          )
        ],
      ));

  Widget buildHeader(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 24),
        Text(
          'Multi-purpose APP',
          style: TextStyle(
              fontSize: 25, color: Theme.of(context).colorScheme.primary),
        )
      ],
    );
  }
}
