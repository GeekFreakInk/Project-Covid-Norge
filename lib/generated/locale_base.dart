import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocaleBase {
  Map<String, dynamic> _data;
  String _path;
  Future<void> load(String path) async {
    _path = path;
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }
  
  Map<String, String> getData(String group) {
    return Map<String, String>.from(_data[group]);
  }

  String getPath() => _path;

  Localemain _main;
  Localemain get main => _main;

  void initAll() {
    _main = Localemain(Map<String, String>.from(_data['main']));
  }
}

class Localemain {
  final Map<String, String> _data;
  Localemain(this._data);

  String get discussion_ => _data["discussion_"];
  String get map_ => _data["map_"];
  String get statistics_ => _data["statistics_"];
  String get county_ => _data["county_"];
  String get infected_ => _data["infected_"];
  String get dead_ => _data["dead_"];
  String get recovered_ => _data["recovered_"];
  String get post_ => _data["post_"];
}
