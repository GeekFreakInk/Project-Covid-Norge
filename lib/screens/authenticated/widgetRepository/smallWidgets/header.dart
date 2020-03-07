
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Covid_Norge/shared/routeConstants.dart';

class Header extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Column(children : <Widget>[
    Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Opacity(
        opacity: 0.0,
        child: RaisedButton(
        onLongPress: () {
          Navigator.pushNamed(context, profileRoute);
        }),
      ),
    ])]);
  }
}