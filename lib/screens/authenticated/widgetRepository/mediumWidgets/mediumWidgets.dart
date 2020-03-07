import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'feedback.dart';
import 'profilePictureStandard.dart';
import 'settings.dart';
import 'bigCheckbox.dart';


class MediumWidgets extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView( 
        children: <Widget>[
          SizedBox(height: 25),
          Padding(padding: EdgeInsets.all(15),
          child:  Wrap(children: <Widget>[
            Text("Settings"),
            Settings(),
            Divider(thickness: 3, color: Colors.black38,),
            Text("FeedBackWidget"),
            FeedbackWidget(),
            Divider(thickness: 3, color: Colors.black38,),
            Text("ProfilePictureStandard"),
            ProfilePictureStandard(),
            Divider(thickness: 3, color: Colors.black38,),
            Text("BigCheckbox"),
            BigCheckbox()
        ],)
    ), SizedBox(height: 100),]);
  }
}