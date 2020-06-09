
import 'package:cook/homeTabs/favorites.dart';
import 'package:cook/homeTabs/popular.dart';
import 'package:cook/homeTabs/whatsNew.dart';
import 'package:cook/homeTabs/whatsNew.dart';
import 'package:cook/homeTabs/whatsNew.dart';
import 'package:cook/screens/pages/about.dart';
import 'package:cook/screens/pages/contact.dart';
import 'package:cook/screens/pages/help.dart';
import 'package:cook/screens/pages/settings.dart';
import 'package:cook/sharedUI/navigation_drawer.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

enum PopOutMenu { HELP, ABOUT, CONTACT, SETTINGS }
class _homeScreenState extends State<homeScreen> with SingleTickerProviderStateMixin {

  TabController _tabController ;
  //= TabController();
  //PostsAPI authorApi = new PostsAPI();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //authorApi.fetChPostsByCategoryId("1");
    return Scaffold(
      appBar: AppBar(


        title: Text("AppBar"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed:(){},
          ),
            _popOutMenu(context),
        ],
        bottom: TabBar(
          tabs: <Widget>[
            Tab(text: "What's new",icon: Icon(Icons.home),),
            Tab(text: "Popular",icon: Icon(Icons.wifi_tethering),),
            Tab(text: "Favorites",icon: Icon(Icons.wallpaper),)
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(
            children: [
              WhatsNew(),
              popular(),
              favorite(),
            ],
            controller: _tabController,
        ),
      ),
    );
  }
  Widget _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.ABOUT,
            child: Text('ABOUT',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500),),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.CONTACT,
            child: Text('CONTACT',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500),),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.HELP,
            child: Text('HELP',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500),),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.SETTINGS,
            child: Text('SETTINGS',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500),),
          ),
        ];
      },
      onSelected: (PopOutMenu menu) {
        switch( menu ){
          case PopOutMenu.ABOUT :
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AboutUs();
            }));
            break;
          case PopOutMenu.SETTINGS:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Settings();
            }));
            break;
          case PopOutMenu.CONTACT :
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ContactUs();
            }));
            break;
          case PopOutMenu.HELP :
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Help();
            }));
            break;
        }
      },
      icon: Icon(Icons.more_vert),
    );
  }
}
