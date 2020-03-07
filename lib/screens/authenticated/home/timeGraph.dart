
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Covid_Norge/screens/authenticated/home/statisticsContainer/dead.dart';
import 'package:Covid_Norge/screens/authenticated/home/statisticsContainer/infected.dart';
import 'package:Covid_Norge/screens/authenticated/home/statisticsContainer/recovered.dart';
import 'package:Covid_Norge/shared/app_localization.dart';


class TimeGraph extends StatefulWidget{

  @override
  _TimeGraphState createState() => new _TimeGraphState();

}

class _TimeGraphState extends State<TimeGraph>{

  final List<Widget> containers = [
    Container(
      child: InfectedStats()),
    Container(
      child: DeadStats()),  
    Container(
      child: RecoveredStats()),  
  ];


  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.blueGrey[800],
        elevation: 3,
        bottom: TabBar(
          indicatorColor: Colors.blueGrey[800],
          tabs: <Widget>[
            Tab(
              text: AppLocalizations.of(context).translate("infected_"),
            ),
            Tab(
              text: AppLocalizations.of(context).translate("dead_"),
            ),
            Tab(
              text: AppLocalizations.of(context).translate("recovered_"),
            ),
          ],
        ),),
        body: TabBarView(
        children: containers,
      )
    )
  );
  }
}