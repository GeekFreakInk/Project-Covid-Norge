import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:Covid_Norge/services/API.dart';


class _StatistikkPanelState extends State<StatistikkPanel>{

  int count = 1;
  var areas = [];
  Map shouldShowArea; 
  bool result;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  void setState(fn){
    if(mounted){
      super.setState(fn);
    }
  }
  @override
  Widget build(BuildContext context) {
    if(result != null){
       return ListView(children: <Widget>[
         Center(child: Text("Count: " + count.toString()),),
         Divider(thickness: 1.5,),
         Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
           RaisedButton(child: Text("1"), color: count == 1? Colors.blue[200] : Colors.grey[200],onPressed: (){setState((){ count = 1;});},),
           RaisedButton(child: Text("5"), color: count == 5? Colors.blue[200] : Colors.grey[200],onPressed: (){setState((){ count = 5;});},),
           RaisedButton(child: Text("10"), color: count == 10? Colors.blue[200] : Colors.grey[200],onPressed: (){setState((){ count = 10;});},),
           RaisedButton(child: Text("50"), color: count == 50? Colors.blue[200] : Colors.grey[200],onPressed: (){setState((){ count = 50;});},),
         ],),
         Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
           RaisedButton(child: Text("100"), color: count == 100? Colors.blue[200] : Colors.grey[200],onPressed: (){setState((){ count = 100;});},),
           RaisedButton(child: Text("250"), color: count == 250? Colors.blue[200] : Colors.grey[200],onPressed: (){setState((){ count = 250;});},),
           RaisedButton(child: Text("500"), color: count == 500? Colors.blue[200] : Colors.grey[200],onPressed: (){setState((){ count = 500;});},),
           RaisedButton(child: Text("1000"), color: count == 1000? Colors.blue[200] : Colors.grey[200],onPressed: (){setState((){ count = 1000;});},),
         ],),
         Divider(thickness: 1.5,),
         SizedBox(height: 25,),
         Column(children: <Widget>[
             for(var area in areas ) 
              if(shouldShowArea[area[0]])
                Column(children: <Widget>[
                  Text(area[0], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  RaisedButton(onPressed: (){ _setValue(area[0], "infected", area[1], "sub", count); setState(() {
                    areas = [];
                  });}, child: Text("-"),),
                  Column(children: <Widget>[
                    Text("Smittede"),
                    Text(area[1].toString())
                  ],),               
                  RaisedButton(onPressed: (){ _setValue(area[0], "infected", area[1], "add", count); setState(() {
                    areas = [];
                  });}, child: Text("+"),),
                ],),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  RaisedButton(onPressed: (){_setValue(area[0], "dead", area[2], "sub", count); setState(() {
                    areas = [];
                  });}, child: Text("-"),),
                  Column(children: <Widget>[
                    Text("Døde"),
                    Text(area[2].toString())
                  ],),               
                  RaisedButton(onPressed: (){_setValue(area[0], "dead", area[2], "add", count); setState(() {
                    areas = [];
                  });}, child: Text("+"),),
                ],),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  RaisedButton(onPressed: (){_setValue(area[0], "recovered", area[3], "sub", count); setState(() {
                    areas = [];
                  });}, child: Text("-"),),
                  Column(children: <Widget>[
                    Text("Friske"),
                    Text(area[3].toString())
                  ],),               
                  RaisedButton(onPressed: (){_setValue(area[0], "recovered", area[3], "add",count); setState(() {
                    areas = [];
                  });}, child: Text("+"),),
                ],),
                Divider(thickness: 1,),
              ],)
            ])]);   
    }else{
      return Container(
        color: Colors.white,
        child: Center(child: CircularProgressIndicator(),));
    }  
  }

  void _setValue(areaName, actionCommand, previousValue, operation, put) async{
    await setValue(areaName, actionCommand, previousValue, operation, put);
    _fetchData();
  }
 
  void _fetchData() async{
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
    

    Map getInfectedAreas = {
      "Agder": prefs.getBool("agderToggle"),
      "Innlandet": prefs.getBool("innlandetToggle"),
      "Møre og Romsdal": prefs.getBool("moreOgRomsdalToggle"), 
      "Nordland": prefs.getBool("nordlandToggle"),
      "Oslo": prefs.getBool("osloToggle"), 
      "Rogaland": prefs.getBool("rogalandToggle"),
      "Troms og Finnmark": prefs.getBool("tromsOgFinnmarkToggle"), 
      "Trøndelag": prefs.getBool("trondelagToggle"),
      "Vestfold og Telemark": prefs.getBool("vestfoldOgTelemarkToggle"), 
      "Vestland": prefs.getBool("vestlandToggle"),
      "Viken": prefs.getBool("vikenToggle"),    
      };
    
    var areaList = await getAreaData();
    for(var i = areaList.length-1; i > -1; i--){
      areas.add([areaList[i]["county"], areaList[i]["infected"], areaList[i]["dead"], areaList[i]["recovered"]]);    
    }
    
    setState(() {
      shouldShowArea = getInfectedAreas;
      result = true;
    });
  }
}

class StatistikkPanel extends StatefulWidget{
  @override
  _StatistikkPanelState createState() => new _StatistikkPanelState();
}