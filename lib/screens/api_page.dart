import 'package:flutter/material.dart';
import 'package:to_do_app/controllers/unsplashController.dart';
import 'package:to_do_app/widgets/BuildAppBar.dart';
import 'package:to_do_app/widgets/NavigationDrawer.dart';
import 'package:to_do_app/widgets/SearchBarCustom.dart';

class APIPage extends StatefulWidget {
  const APIPage({super.key});

  @override
  State<APIPage> createState() => _APIPage();
}

class _APIPage extends State<APIPage> {
  late Image _image;
  String _searchQuery = "";

  @override
  void initState() {
    _image = Image.asset('assets/images/avatar.jpeg');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: buildAppBar(context),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SearchBarCustom(onValueChanged: (value) {
                _handleValueChanged(value);
              }),
              OutlinedButton.icon(
                label: const Text("Search"),
                onPressed: () {
                  sendApiRequest(_searchQuery);
                },
                icon: Icon(Icons.search, color: theme.primaryColor),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: _image,
              )
            ],
          ),
        ));
  }

  void sendApiRequest(String request) {
    setState(() {
      UnsplashController().getRandomPhoto(request).then((value) {
        _image = Image.network(value);
      });
    });
  }

  void _handleValueChanged(String value) {
    _searchQuery = value;
  }
}
