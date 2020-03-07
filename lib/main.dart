import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'shared/routes.dart';
import 'shared/routeConstants.dart';
import 'shared/app_localization.dart';
import 'services/auth.dart';
import 'models/user.dart';


void main() => runApp(App()); 


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value (
      value: AuthService().user, // access user-stream on instance
          child: MaterialApp(
        onGenerateRoute: Router.generateMainRoute,
        initialRoute: homeRoute,
        
        supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale('nb', 'NO'), // Norwegian
          const Locale('zh', 'CN'), // Chinese
          //const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
        ],
        
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],  
       
        localeResolutionCallback: (locale, supportedLocales){
            if (locale != null){
              for (var supportedLocale in supportedLocales){
              if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode){
                return supportedLocale;
              } 
            } 
          }
          return supportedLocales.first;
        },
      ),
    );
  }

}

