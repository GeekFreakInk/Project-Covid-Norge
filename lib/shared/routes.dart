import 'package:flutter/material.dart';
import 'package:Covid_Norge/screens/authenticated/settings/adminPanel.dart';
import 'routeConstants.dart';
import 'package:Covid_Norge/screens/authenticated/widgetRepository/widgetsRepository.dart';
import 'package:Covid_Norge/screens/authenticated/wrapper.dart';
import 'package:Covid_Norge/screens/authenticated/home/homePage.dart';


class Router {
  //Main routes -- first layer
  static Route<dynamic> generateMainRoute(RouteSettings settings) {
    switch (settings.name){
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Startup());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => Wrapper());
      case adminPanelRoute:
        return MaterialPageRoute(builder: (_) => AdminPanel());
      case widgetsRepositoryRoute:
        return MaterialPageRoute(builder: (_) => Widgets());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        )
      );
    }
  }
}
  

  
