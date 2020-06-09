import 'package:cook/screens/home_screen.dart';
import 'package:cook/screens/onBoard.dart';
import 'package:cook/utilities/app_theme.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:async/async.dart';

void main() {
  //SharedPreferences prefs = await SharedPreferences.getInstance();
  //bool seen = prefs.getBool('seen');
  Widget _screen;
  /*if(seen == null || seen==false){
    _screen = onBoarding();
  }else{
    _screen = homeScreen();
  }*/
  _screen = homeScreen();
  runApp( newApp(_screen) );
}


class newApp extends StatelessWidget {
  final Widget _screen;
  newApp(this._screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: this._screen,
      theme: AppTheme.appTheme,
    );
  }
}
