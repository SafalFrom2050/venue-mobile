import 'package:flutter/material.dart';
import 'navigation_drawer_widget.dart';

class peoplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Logout'),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
      );
}
