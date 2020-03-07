import 'package:flutter/cupertino.dart';
import 'package:Covid_Norge/screens/authenticated/widgetRepository/smallWidgets/textModal.dart';
import 'academicLevel.dart';
import 'header.dart';
import 'languageSelect.dart';
import 'reactionsOption.dart';

class SmallWidgets extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView( 
        children: <Widget>[
          SizedBox(height: 25),
          Padding(padding: EdgeInsets.all(15),
          child:  Wrap(children: <Widget>[
            Column(children: <Widget>[
              Text("Header"),
             Header(),
            ],),
            Column(children: <Widget>[
              Text("ReactionOptions"),
              ReactionOptions(),
            ],),
            Column(children: <Widget>[
              Text("AcademicLevel"),
              AcademicLevel(),
            ],),
            Column(children: <Widget>[
              SizedBox(height: 10,),
              Text("LanguageSelect"),
              SizedBox(height: 10,),
              LanguageSelect(),
            ],),
           Column(children: <Widget>[
              SizedBox(height: 10,),
              Text("TextFieldAlertDialog"),
              SizedBox(height: 10,),
              TextFieldAlertDialog(),
            ],),
          ],)
    )]);
  }
}