import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:myhomepage/Events.dart';
import 'package:myhomepage/constants.dart';
import 'package:myhomepage/details_page.dart';
import 'package:myhomepage/items/items_screen.dart';
import 'package:myhomepage/main.dart';
import 'package:myhomepage/splash.dart';
import 'FeedbackScreen.dart';
import 'Home_Page.dart';
import 'button_widget.dart';
import 'people_page.dart';
import 'user_page.dart';
import 'contact.dart';
import 'Feedback.dart';
import 'details_page.dart';
import 'booking.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Subina Magar';
    final email = 'subina2@gmail.com';
    final urlImage =
        'https://images.unsplash.com/photo-1555920141-8ffbcdf2d8b0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGxvZ298ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60';

    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: bgColor,
            title: Text(
              'Welcome to Venue App',
            ),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: accentColor,
              indicatorWeight: 3,
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.location_on_outlined), text: 'Events'),
                Tab(icon: Icon(Icons.food_bank_outlined), text: 'Items'),
                Tab(icon: Icon(Icons.book_online), text: 'Booking'),
                Tab(icon: Icon(Icons.reviews_outlined), text: 'Feedback'),
              ],
            ),
          ),
          drawer: Drawer(
            child: Material(
              color: bgColor,
              child: ListView(
                children: <Widget>[
                  buildHeader(
                    urlImage: urlImage,
                    name: name,
                    email: email,
                    onClicked: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserPage(
                        name: 'Subina Chuni',
                        urlImage: urlImage,
                      ),
                    )),
                  ),
                  Container(
                    padding: padding,
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        buildSearchField(),
                        const SizedBox(height: 24),
                        buildMenuItem(
                          text: 'Contact',
                          icon: Icons.update,
                          onClicked: () => selectedItem(context, 1),
                        ),
                        const SizedBox(height: 24),
                        buildMenuItem(
                          text: 'Feedback',
                          icon: Icons.account_tree_outlined,
                          onClicked: () => selectedItem(context, 2),
                        ),
                        const SizedBox(height: 16),
                        buildMenuItem(
                          text: 'Logout',
                          icon: Icons.notifications_outlined,
                          onClicked: () => selectedItem(context, 3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [Home_page(), Events(), ItemsScreen(title: "Items"), BookingScreen(), Feedbacks()],
          )),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white70;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white70;
    final hoverColor = secondaryColor;

    return ListTile(
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color)),
        hoverColor: hoverColor,
        onTap: onClicked);
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => peoplePage(),
        ));
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => contact(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FeedbackScreen(),
        ));
        break;
    }
  }
}
