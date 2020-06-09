/*import 'package:flutter/material.dart';

class navigationDrawer extends StatefulWidget {
  @override
  _navigationDrawerState createState() => _navigationDrawerState();
}

class _navigationDrawerState extends State<navigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

    );
  }
}*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cook/models/nav_menu.dart';
import 'package:cook/screens/home_screen.dart';
import 'package:cook/screens/headline_news.dart';
import 'package:cook/screens/twitter_feed.dart';
import 'package:cook/screens/instagram_feed.dart';
import 'package:cook/screens/facebook_feed.dart';
//import 'package:cook/utilities/app_utilities.dart';
import 'package:cook/screens/pages/login.dart';
//import 'package:shared_preferences/shared_preferences.dart';


class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  static bool isLoggedIn = false;

  String token;

  //SharedPreferences sharedPreferences;
  List<NavMenuItem> navigationMenu = [
    NavMenuItem("Explore", () => homeScreen()),
    NavMenuItem("Headline News", () => HeadLineNews()),
    NavMenuItem("Twitter Feeds", () => TwitterFeed() ),
    NavMenuItem("Instagram Feeds", () => InstagramFeed() ),
    NavMenuItem("Facebook Feeds", () => FacebookFeeds() ),
    NavMenuItem("Login", () => Login() ),
//    NavMenuItem("Register", () => FacebookFeeds() ),
  ];

  /*_checkToken() async{
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.get('token');
    setState(() {
      if( token == null ){
        isLoggedIn = false;
      }else{
        isLoggedIn = true;
      }
    });
  }

  _logout(){
    if( sharedPreferences != null ){
      sharedPreferences.remove('token');
    }
    return HomeScreen();
  }

  @override
  void initState() {
    super.initState();

    if( isLoggedIn ){
      navigationMenu.add( NavMenuItem("Logout", _logout ) );
    }

  }
*/
  @override
  Widget build(BuildContext context) {
    /*if( this.mounted ){
      _checkToken();
    }*/
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 75, left: 4.0),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                title: Text(
                  navigationMenu[position].title,
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => navigationMenu[position].destination() ));
                },
              ),
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}





