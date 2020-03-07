import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'adminSettings/fylker.dart';
import 'adminSettings/statisticsPanel.dart';


class AdminPanel extends StatelessWidget{

  final List<Widget> containers = [
    Container(
      child: Fylker()),
    Container(
      child: StatistikkPanel())
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text("AdminPanel"),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(text: "Fylker"),
            Tab(text: "sett statstikk"),
          ],
        ),
      ),
      body:TabBarView(children: containers),
    ));
  }
}