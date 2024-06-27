
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home.dart';
import 'package:to_do_app/screens/settings.dart';
import 'package:to_do_app/constants/colors.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(vertical: 50);
  final isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
          child: Container(
            color: Theme.of(context).cardColor,
            child: Column(
              children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    child: buildHeader(),
                  ),
                  Spacer(),
                  buildCollapseIcon(context, isCollapsed),
                  const SizedBox(height: 12)
                  //listItemHome(context),
                  //listItemSettings(context)
              ],
            ),
          ),
        ),
    );
  }

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Container(
          child: Row (
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(icon, color: Colors.black),
              Padding(padding: EdgeInsets.only(right: 20))
            ],
          ) 
        ),
        onTap: () {
          /**I'm not quite sure why this works to close the drawer 
           * but it does
          */
          Navigator.pop(context);
        },
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
    child: const Row(
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

  Widget buildHeader() => const Row(
    children: [
      const SizedBox(width: 24),
      Text('Multi-purpose APP',
        style: TextStyle(
          fontSize: 25,
          color: Colors.white38
        ),
      )
    ],
  );
}