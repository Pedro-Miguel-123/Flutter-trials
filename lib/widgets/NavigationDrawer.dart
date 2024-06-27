
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home.dart';
import 'package:to_do_app/screens/settings.dart';
import 'package:to_do_app/constants/colors.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(vertical: 50);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
          child: Container(
            child: Column(
              children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    color: Theme.of(context).colorScheme.primary,
                    child: buildHeader(),
                  )
                  //listItemHome(context),
                  //listItemSettings(context)
              ],
            ),
          ),
        ),
    );
  }

  //Home button
  Widget listItemHome(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home())
        );
    },
    child: Row(
      children: const [
        Padding(padding: EdgeInsets.only(left: 10)),
        Icon(Icons.home, color: tdRed,),
        Padding(padding: EdgeInsets.only(left: 15)),
        Text('Home', style: TextStyle(
          fontSize: 20
        ),)
      ],
    )
  );

  //Settings Button
  Widget listItemSettings(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Settings())
        );
    },
    child: const Row(
      children: [
        Padding(padding: EdgeInsets.only(left: 10)),
        Icon(Icons.settings, color: tdRed,),
        Padding(padding: EdgeInsets.only(left: 15)),
        Text('Settings', style: TextStyle(
          fontSize: 20
        ),)
      ],
    )
  );

  Widget buildHeader() => Container(
      child: const Text('Multi-purpose APP',
        style: TextStyle(
        fontSize: 25
      ),
    ),
  );
}