import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../pagemodel.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'home_screen.dart';
import 'package:async/async.dart';

class onBoarding extends StatefulWidget {
  @override
  _onBoardingState createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {

  ValueNotifier<int> _pageIndexNotifier = ValueNotifier(0);
  List<PageModel> pages ;/// null ///

  void _addPage(){
    pages = List<PageModel>();/// 0 ///
    pages.add(PageModel('WELCOME','Wish you have delicious snacks with us',Icons.ac_unit,'assets/images/bg1.jpg'));
    pages.add(PageModel('Delicious','Wish you have delicious snacks with us',null,'assets/images/bg2.jpg'));
    pages.add(PageModel('Tasty','Wish you have delicious snacks with us',null,'assets/images/bg3.jpg'));
    pages.add(PageModel('Satisfied','Wish you have delicious snacks with us',null,'assets/images/bg4.jpg'));
  }
  @override
  Widget build(BuildContext context) {
    _addPage();
    //List<Widget> _widgets = _drawPageIndicator();
    return Stack(
          children: <Widget>[
            Scaffold(
              body: PageView.builder(
                itemBuilder: (context, index) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: ExactAssetImage(pages[index].image),
                                fit: BoxFit.cover)),
                        //color: Colors.black,
                      ),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.center, //column with other widget
                        mainAxisAlignment:
                        MainAxisAlignment.center, //for the column's children
                        children: <Widget>[
                          Transform.translate(
                            child: Icon(
                              pages[index].icon,
                              size: 150.0,
                              color: Colors.white,
                            ),
                            offset: Offset(0, -100),
                          ),
                          Text(
                            pages[index].title,
                            style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            child: Text(
                              pages[index].description,
                              style: TextStyle(color: Colors.white70, fontSize: 16.0,),
                              textAlign: TextAlign.center,
                            ),
                            padding: EdgeInsets.only(left: 48.0, right: 48.0, top: 18.0),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                itemCount: pages.length,
                onPageChanged: (index){
                  _pageIndexNotifier.value= index;
                },
              ),
            ),
            Transform.translate(
              offset: Offset(0, 175),
              child: Align(
                alignment: Alignment.center,
                child: _displayPageIndicator(pages.length),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0,right: 16.0, bottom: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: RaisedButton(
                    color: Colors.green.shade900,
                      child: Text(
                        'GET STARTED',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 1.0,
                        ),),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          _updateSeen();
                          return homeScreen();
                        }
                      ));
                    },
                  ),
                ),
              ),
            ),
          ],
        );
  }

  Widget _displayPageIndicator(int length){
    return PageViewIndicator(
      pageIndexNotifier: _pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
          color: Colors.white,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(parent: animationController, curve: Curves.ease),
        child: Circle(
          size: 12.0,
          color: Colors.green.shade900,
        ),
      ),
    );

  }

  void _updateSeen() async{
    //SharedPreferences pref = await SharedPreferences.getInstance();
    //pref.setBool('seen', true);
  }

}