import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(child: ListView(scrollDirection: Axis.vertical,
    shrinkWrap: true, children: <Widget>[
      ListTile(leading: Icon(Icons.mode_edit), title: Text("Settings"), onTap: (){},),
      ListTile(leading: Icon(Icons.build), title: Text("Dine preferanser"), onTap: (){},), //change to Screwdriver
      ListTile(leading: Icon(Icons.lock), title: Text("Endre passord"), onTap: (){},),
      ListTile(leading: Icon(Icons.payment), title: Text("Betalingsmetode"), onTap: (){},),
      ListTile(leading: Icon(Icons.power_settings_new), title: Text("Log ut"), onTap: (){},)
    ],),);
  }
}

