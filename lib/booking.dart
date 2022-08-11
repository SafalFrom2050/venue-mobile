import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime dateTime = DateTime.now();
  int index = 0;

  static List<String> values = [
    'Wedding',
    'Anniversary',
    'Birthday',
    'New Year Party',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
          padding: EdgeInsets.only(top: 50, right: 25, left: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {},
                    child: TextButton(
                      onPressed: () {},
                      child: Text('View Booked Schedule'),
                    ),
                  ),
                ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Select Event",
                      style: TextStyle(fontSize: 16),
                    ),
                    buildCustomPicker(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Pick a Date and Time",
                      style: TextStyle(fontSize: 16),
                    ),
                    buildDatePicker(),
                    SizedBox(
                      height: 20,
                    ),
                    buildSubmitButton(),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          )),
    );
  }

  Widget buildDatePicker() => SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width - 30,
      child: CupertinoTheme(
        data: CupertinoThemeData(
          brightness: Brightness.dark,
        ),
        child: CupertinoDatePicker(
          minimumYear: 2015,
          maximumYear: DateTime.now().year,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.dateAndTime,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      ));

  Widget buildCustomPicker() => SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width - 30,
        child: CupertinoTheme(
          data: CupertinoThemeData(brightness: Brightness.dark),
          child: CupertinoPicker(
            itemExtent: 64,
            diameterRatio: 0.7,
            looping: true,
            onSelectedItemChanged: (index) =>
                setState(() => this.index = index),
            // selectionOverlay: Container(),
            selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
              background: Colors.pink.withOpacity(0.12),
            ),
            children: modelBuilder<String>(
              values,
              (index, value) {
                final isSelected = this.index == index;
                final color = isSelected ? accentColor : Colors.white70;

                return Center(
                  child: Text(
                    value,
                    style: TextStyle(color: color, fontSize: 18),
                  ),
                );
              },
            ),
          ),
        ),
      );

  List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  Widget buildSubmitButton() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(
              icon: Icon(Icons.book),
              label: Text(
                "Book",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(15))),
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('Booking Successful!'),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }),
        ]);
  }
}
