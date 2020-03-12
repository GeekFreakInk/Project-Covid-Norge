import 'dart:convert';
import 'dart:io';
import 'package:Covid_Norge/shared/config.dart';
import 'package:intl/intl.dart';
import "package:http/http.dart" as http;

getAreaData() async {
  var areaListJSON;
  try{
   areaListJSON = await http.get(properties['Api']['BaseUrl']+"/areas");
    return json.decode(areaListJSON.body);
  }catch(e){
    return -1;
  }
}

fetchPosts() async {
  var postList;
  try{
    postList = await http.get(properties['Api']['BaseUrl'] + "/posts");
    return json.decode(postList.body);
  }catch(e){
    return -1;
    
  }
}

Future<bool> syncData() async {
  var areas = [
    "Agder",
    "Innlandet",
    "Møre og Romsdal",
    "Nordland",
    "Oslo",
    "Rogaland",
    "Troms og Finnmark",
    "Trøndelag",
    "Vestfold og Telemark",
    "Vestland",
    "Viken"
  ];
  var url = "api/areas";
  var id = 0;
  for (var area in areas) {
    Map body = {
      "id": id,
      "county": area,
      "infected": 0,
      "dead": 0,
      "recovered": 0,
    };
    await postRequest(body, url);
  }
  return true;
}

Future<bool> setValue(areaName, actionCommand, previousValue, operation, count) async {
  var newValue = operation == "sub" ? previousValue - count : previousValue + count;
  var url = "/areas";

  Map body = {
    "county": areaName,
    "infected": actionCommand == "infected" ? newValue : -1,
    "dead": actionCommand == "dead" ? newValue : -1,
    "recovered": actionCommand == "recovered" ? newValue : -1,
  };

  await postRequest(body, url);
  return true;
}

Future<bool> writePost(String text, id) async {
  var _text = text.replaceAll('"', '""').replaceAll("'", "''");
  DateTime now = DateTime.now();
  var _dato = DateFormat('dd-MM-yyyy').format(now).toString();
  var url = "/posts";
  Map body = {
    "id": id,
    "comment": _text,
    "posted": _dato,
  };

  await postRequest(body, url);
  return true;
}

Future<HttpClientResponse> postRequest(Map body, path) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request =
      await httpClient.postUrl(Uri.parse(properties['Api']['BaseUrl'] + path));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode(body)));
  HttpClientResponse response = await request.close();
  await response.transform(utf8.decoder).join();
  httpClient.close();
  return response;
}
