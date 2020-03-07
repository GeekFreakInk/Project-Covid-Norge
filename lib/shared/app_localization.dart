import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  Map<dynamic, dynamic> _localizedGroup;
  Map<dynamic, dynamic> _localizedStrings;
  
  Future<bool> load() async {
    String jsonString =
      await rootBundle.loadString('locales/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    
    
    _localizedGroup = jsonMap.map((group, keys){
      _localizedStrings = jsonMap[group].map((key, value){
        return MapEntry(key, value);
      });
      return MapEntry(group, keys.toString());
    });
    return true;
  }
  String translate(String key) {
    return _localizedStrings[key]; 
  }
}

class _AppLocalizationsDelegate 
  extends LocalizationsDelegate<AppLocalizations>{

    const _AppLocalizationsDelegate();

    @override
    bool isSupported(Locale locale){
      return ['en', 'nb','zh'].contains(locale.languageCode);
    }

    @override
    Future<AppLocalizations> load(Locale locale) async {
      AppLocalizations localizations = new AppLocalizations(locale);
      await localizations.load();
      return localizations;
    }

    @override
    bool shouldReload(_AppLocalizationsDelegate old) => false;
}
