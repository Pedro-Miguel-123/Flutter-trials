
import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/widgets/BuildAppBar.dart';
import 'package:to_do_app/widgets/NavigationDrawer.dart';

class Settings extends StatelessWidget {
  Settings({ Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      backgroundColor: tdBlack,
      appBar: buildAppBar(),
      body: Column(
        children: [
          Text('Settings', style: TextStyle(fontSize: 30),)
        ],
      ),
    );
  }

  
}