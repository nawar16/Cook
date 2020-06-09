import 'package:flutter/material.dart';

class popular extends StatefulWidget {
  @override
  _popularState createState() => _popularState();
}

class _popularState extends State<popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: _drawSingleRow(),
        );
      },
      itemCount: 20,
    );
  }
  Widget _drawSingleRow(){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            child: Image(image: ExactAssetImage('assets/images/placeholder_bg.png'),
            ),
            width: 124.0, height: 124.0,
          ),//image
          SizedBox(width:8.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("title of post", maxLines: 2,style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, ),),
                SizedBox(height: 18.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Author name"),
                    Row(
                      children: <Widget>[
                        Icon(Icons.timer),
                        Text("15 min"),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )//text
        ],
      ),
    );
  }
}
