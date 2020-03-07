import 'package:flutter/material.dart';
import 'package:Covid_Norge/screens/authenticated/widgetRepository/largeWidgets/largeWidgets.dart';
import 'package:Covid_Norge/screens/authenticated/widgetRepository/mediumWidgets/mediumWidgets.dart';
import 'package:Covid_Norge/screens/authenticated/widgetRepository/smallWidgets/smallWidgets.dart';


class Widgets extends StatelessWidget {
  final List<Widget> containers = [
      Container(
          child: SmallWidgets()),
      Container(
          child: MediumWidgets()),
      Container(
          child: LargeWidgets()),
    ];


  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: AppBar(
        title: Text("Widget Repository"),
         bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: /*AppLocalizations.of(context).translate("home_")*/"Small",
              ),
              Tab(
                text: /*AppLocalizations.of(context).translate("course_")*/ "Medium",
              ),
              Tab(
                text: /*AppLocalizations.of(context).translate("studyBuddies_")*/ "Large",
              )
            ],
          ),
      ),
      body: TabBarView(
          children: containers,
      )));
  }
}
