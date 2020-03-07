import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import "package:http/http.dart" as http;


Future<List> getAreaData () async{
  var  areaListJSON = await http.get("http://10.0.2.2:5000/api/areas");
  return json.decode(areaListJSON.body);
}

Future<List> fetchPosts() async{
  var  postList = await http.get("http://10.0.2.2:5000/api/posts");
  return json.decode(postList.body);
}

Future<bool> syncData() async{
  var areas = ["Agder", "Innlandet", "Møre og Romsdal", "Nordland", "Oslo", "Rogaland", "Troms og Finnmark", "Trøndelag", "Vestfold og Telemark", "Vestland", "Viken"];
  var url = "http://10.0.2.2:5000/api/areas";
  var id = 0;
  for(var area in areas){
    Map body = {
      "id": id,
      "county": area, 
      "infected": 0,
      "dead" : 0,
      "recovered": 0,
    };

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(body)));
    HttpClientResponse response = await request.close();
    await response.transform(utf8.decoder).join();
    httpClient.close();
    id++;
  }
  return true;
}

 Future<bool> setValue(areaName, actionCommand, previousValue, operation) async{
  var newValue = operation == "sub" ? previousValue - 1: previousValue + 1;
  var url = "http://10.0.2.2:5000/api/areas";
  
  Map body = {
    "county": areaName, 
    "infected": actionCommand == "infected" ? newValue : -1,
    "dead" : actionCommand == "dead" ? newValue : -1,
    "recovered": actionCommand == "recovered" ? newValue : -1,
  };

  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode(body)));
  HttpClientResponse response = await request.close();
  await response.transform(utf8.decoder).join();
  httpClient.close();
  return true; 
}


Future<bool> writePost(String text, id) async{
  var _text = text.replaceAll('"', '""').replaceAll("'", "''");
  DateTime now = DateTime.now(); 
  var _dato = DateFormat('dd-MM-yyyy').format(now).toString();
  var url = "http://10.0.2.2:5000/api/posts";
  Map body = {
    "id": id, 
    "comment": _text,
    "posted" : _dato,
  };

  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode(body)));
  HttpClientResponse response = await request.close();
  await response.transform(utf8.decoder).join();
  httpClient.close();
  return true;
}