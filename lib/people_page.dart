import 'package:flutter/material.dart';

class peoplePages extends StatelessWidget {
  const peoplePages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Booking'),
          centerTitle: true,
          backgroundColor: Colors.pink[100],
        ),
      );
}

class peoplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer
        appBar: AppBar(
          title: Text('Items'),
          centerTitle: true,
          backgroundColor: Colors.blue[100],
        ),
      );
}

class peoplesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer
        appBar: AppBar(
          title: Text('Contacts'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
      );
}

class navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer
        appBar: AppBar(
          title: Text('Feedbacks'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
      );
}
