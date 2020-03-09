import 'package:shared_preferences/shared_preferences.dart';

Future<void> updateValues(String prefString, bool setting) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(prefString, setting);
}


Future<Map> fetchSavedData() async{
  final prefs = await SharedPreferences.getInstance();
  
  prefs.getBool('agderToggle') ??  await prefs.setBool('agderToggle', false);

  prefs.getBool('innlandetToggle') ?? await prefs.setBool('innlandetToggle', false);
  
  prefs.getBool('moreOgRomsdalToggle') ?? await prefs.setBool('moreOgRomsdalToggle', false);

  prefs.getBool('nordlandToggle') ?? await prefs.setBool('nordlandToggle', false);
  
  prefs.getBool('osloToggle') ?? await prefs.setBool('osloToggle', false);

  prefs.getBool('rogalandToggle') ?? await prefs.setBool('rogalandToggle', false);
  
  prefs.getBool('tromsOgFinnmarkToggle') ?? await prefs.setBool('tromsOgFinnmarkToggle', false);
  
  prefs.getBool('trondelagToggle') ?? await prefs.setBool('trondelagToggle', false);
  
  prefs.getBool('vestfoldOgTelemarkToggle') ?? await prefs.setBool('vestfoldOgTelemarkToggle', false);
      
  prefs.getBool('vestlandToggle') ?? await prefs.setBool('vestlandToggle', false);
      
  prefs.getBool('vikenToggle') ?? await prefs.setBool('vikenToggle', false);
  

  Map loadedPrefs = {
    "agderToggle":  prefs.getBool('agderToggle'),
    "innlandetToggle":  prefs.getBool('innlandetToggle'),
    "moreOgRomsdalToggle":prefs.getBool('moreOgRomsdalToggle'),
    "nordlandToggle": prefs.getBool('nordlandToggle'),
    "osloToggle": prefs.getBool('osloToggle'),
    "rogalandToggle":prefs.getBool('rogalandToggle'),
    "tromsOgFinnmarkToggle": prefs.getBool('tromsOgFinnmarkToggle'),
    "trondelagToggle": prefs.getBool('trondelagToggle'),
    "vestfoldOgTelemarkToggle": prefs.getBool('vestfoldOgTelemarkToggle'),
    "vestlandToggle": prefs.getBool('vestlandToggle'),
    "vikenToggle": prefs.getBool('vikenToggle'),
  };

  return loadedPrefs;
}