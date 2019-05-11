import 'package:flutter/material.dart';

const String _name = "hasnain";

class chatMessage extends StatelessWidget {
  final String text;

  chatMessage({this.text});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(right: 10.0),
            child: new CircleAvatar(
              child: new Text(_name[0]),
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name,style: Theme.of(context).textTheme.subhead,),
              new Container(
                child: new Text(text),
              )
            ],
          )
        ],
      ),
    );
  }
}
