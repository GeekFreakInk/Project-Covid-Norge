import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:Covid_Norge/screens/authenticated/widgetRepository/mediumWidgets/profilePictureStandard.dart';
import 'package:Covid_Norge/services/API.dart';
import 'package:Covid_Norge/services/auth.dart';
import 'package:Covid_Norge/shared/routeConstants.dart';

class Profile extends StatefulWidget { 
  @override
  _ProfileState createState() => new _ProfileState();  
}

class _ProfileState extends State<Profile>{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final AuthService _auth = AuthService(); // Allow access to signOut() method from auth.dart
  String userEmail = "";
  String uid = "";
  bool isAdmin = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  void setState(fn){
    if(mounted){
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text("Admin"),
      ),
      body: ListView(
            children: <Widget>[
              Center(child: Text(userEmail, style: TextStyle(fontSize: 30),),),
              Divider(indent: 50, endIndent: 50, color: Colors.grey, thickness: 1.5,),
              ProfilePictureStandard(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                RaisedButton(onPressed: () {
                Navigator.pop(context); Navigator.pushNamed(context, adminPanelRoute); },
                child: Text("Innstillinger")
                ),
                RaisedButton(
                  child: Text("Sync"),
                  onPressed: () {
                  Alert(context: context, title: "NB", 
                  content: Container(
                  height: 150,
                  child:Text("Er du sikker på at du vil synkronisere databasen? Database BØR være tom!"),),
                  buttons: [
                    DialogButton(child: Text("post"), onPressed: ()=> {
                        syncData(),
                      Navigator.pop(context)
                    }),
                  ]).show(); }), 
              ]),
            SizedBox(height: 150),
            Center(child: RaisedButton(child: Text("Logut"), onPressed: () async {
            await _auth.signOut();
            Navigator.popAndPushNamed(context, homeRoute);
          },
        ),
      )
    ]));
    }
}   

