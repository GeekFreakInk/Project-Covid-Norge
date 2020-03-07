import 'package:flutter/material.dart';
import 'package:Covid_Norge/screens/authenticated/home/statistics.dart';
import 'package:Covid_Norge/screens/authenticated/home/timeGraph.dart';
import 'package:Covid_Norge/screens/authenticated/widgetRepository/smallWidgets/header.dart';
import 'package:Covid_Norge/shared/app_localization.dart';
import 'discussion.dart';
import 'package:splashscreen/splashscreen.dart';

class Startup extends StatefulWidget{
  @override
  _StartupState createState () =>  new _StartupState();
}


class _StartupState extends State<Startup>{
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      backgroundColor: Colors.white,
      image: Image.asset("assets/logo.png"),
      photoSize: 150.0,
      navigateAfterSeconds: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  // Will be displayed when the corresponding tab gets selected
  final List<Widget> containers = [
    Container(
      child: Discussion()),
    Container(
      child: Statistics()),
    Container(
      child: TimeGraph()),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          actions: <Widget>[
            Header(),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: AppLocalizations.of(context).translate("discussion_"),
              ),
              Tab(
                text: AppLocalizations.of(context).translate("statistics_"),
              ),
              Tab(
                text: AppLocalizations.of(context).translate("graphs_"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: containers,
        ),
      ),
    );
  } 
}
