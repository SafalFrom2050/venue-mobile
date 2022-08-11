import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:myhomepage/constants.dart';

class contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: ContactUsBottomAppBar(
            companyName: 'Subina Chuni Magar',
            textColor: Colors.white,
            backgroundColor: bgColor,
            email: 'subinachuni@gmail.com',
            // textFont: 'Sail',
          ),
          backgroundColor: bgColor,
          body: Column(
            children: [
              AppBar(
                title: Text("Contact Us"),
                leading: BackButton(color: Colors.white70),
              ),
              ContactUs(
                  cardColor: bgColor,
                  textColor: Colors.white70,
                  logo: AssetImage('assets/images/splash.jpg'),
                  email: 'subinachuni@gmail.com',
                  companyName: 'Venue Management',
                  companyColor: Colors.white70,
                  dividerThickness: 2,
                  phoneNumber: '+9803784150',
                  githubUserName: 'SubinaChuni',
                  tagLine: 'please contact us for more details',
                  taglineColor: Colors.white70,
                  twitterHandle: 'SubinaChuni',
                  instagram: 'subina.chuni.magar',
                  facebookHandle: 'Subina Magar'),
            ],
          )),
    );
  }
}
