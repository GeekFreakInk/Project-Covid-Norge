import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:Covid_Norge/services/API.dart';


class _StatistikkPanelState extends State<StatistikkPanel>{

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
                  RaisedButton(onPressed: (){ _setValue(area[0], "infected", area[1], "sub"); setState(() {
                    areas = [];
                  });}, child: Text("-"),),
                  Column(children: <Widget>[
                    Text("Smittede"),
                    Text(area[1].toString())
                  ],),               
                  RaisedButton(onPressed: (){ _setValue(area[0], "infected", area[1], "add"); setState(() {
                    areas = [];
                  });}, child: Text("+"),),
                ],),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  RaisedButton(onPressed: (){_setValue(area[0], "dead", area[2], "sub"); setState(() {
                    areas = [];
                  });}, child: Text("-"),),
                  Column(children: <Widget>[
                    Text("Døde"),
                    Text(area[2].toString())
                  ],),               
                  RaisedButton(onPressed: (){_setValue(area[0], "dead", area[2], "add"); setState(() {
                    areas = [];
                  });}, child: Text("+"),),
                ],),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  RaisedButton(onPressed: (){_setValue(area[0], "recovered", area[3], "sub"); setState(() {
                    areas = [];
                  });}, child: Text("-"),),
                  Column(children: <Widget>[
                    Text("Friske"),
                    Text(area[3].toString())
                  ],),               
                  RaisedButton(onPressed: (){_setValue(area[0], "recovered", area[3], "add"); setState(() {
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

  void _setValue(areaName, actionCommand, previousValue, operation) async{
    await setValue(areaName, actionCommand, previousValue, operation);
    _fetchData();
  }
 
  void _fetchData() async{
    final prefs = await SharedPreferences.getInstance();
    var areaList = await getAreaData();
  
    bool _agderLocalVariable = prefs.getBool('agderToggle');
    _agderLocalVariable == null ? await prefs.setBool('agderToggle', false) : _agderLocalVariable;

    bool _innlandetLocalVariable= prefs.getBool('innlandetToggle');
    _innlandetLocalVariable == null ? await prefs.setBool('innlandetToggle', false) : _innlandetLocalVariable;
   
    bool _moreOgRomsdalLocalVariable = prefs.getBool('moreOgRomsdalToggle');
    _moreOgRomsdalLocalVariable == null ? await prefs.setBool('moreOgRomsdalToggle', false) : _moreOgRomsdalLocalVariable;
    
    bool _nordlandLocalVariable = prefs.getBool('nordlandToggle');
    _nordlandLocalVariable == null ? await prefs.setBool('nordlandToggle', false) : _nordlandLocalVariable;
    
    bool _osloLocalVariable = prefs.getBool('osloToggle');
    _osloLocalVariable == null ? await prefs.setBool('osloToggle', false) : _osloLocalVariable;
    
    bool _rogalandLocalVariable = prefs.getBool('rogalandToggle');
    _rogalandLocalVariable == null ? await prefs.setBool('rogalandToggle', false) : _rogalandLocalVariable;
    
    bool _tromsOgFinnmarkLocalVariable = prefs.getBool('tromsOgFinnmarkToggle');
    _tromsOgFinnmarkLocalVariable == null ? await prefs.setBool('tromsOgFinnmarkToggle', false) : _tromsOgFinnmarkLocalVariable;
    
    bool _trondelagLocalVariable = prefs.getBool('trondelagToggle');
    _trondelagLocalVariable == null ? await prefs.setBool('trondelagToggle', false) : _trondelagLocalVariable;
    
    bool _vestfoldOgTelemarkLocalVariable = prefs.getBool('vestfoldOgTelemarkToggle');
    _vestfoldOgTelemarkLocalVariable == null ? await prefs.setBool('vestfoldOgTelemarkToggle', false) : _vestfoldOgTelemarkLocalVariable;
        
    bool _vestlandLocalVariable = prefs.getBool('vestlandToggle');
    _vestlandLocalVariable == null ? await prefs.setBool('vestlandToggle', false) : _vestlandLocalVariable;
        
    bool _vikenLocalVariable = prefs.getBool('vikenToggle');
    _vikenLocalVariable == null ? await prefs.setBool('vikenToggle', false) : _vikenLocalVariable;
    

    Map getInfectedAreas = {
      "Agder": _agderLocalVariable, 
      "Innlandet": _innlandetLocalVariable,
      "Møre og Romsdal": _moreOgRomsdalLocalVariable, 
      "Nordland": _nordlandLocalVariable,
      "Oslo": _osloLocalVariable, 
      "Rogaland": _rogalandLocalVariable,
      "Troms og Finnmark": _tromsOgFinnmarkLocalVariable, 
      "Trøndelag": _trondelagLocalVariable,
      "Vestfold og Telemark": _vestfoldOgTelemarkLocalVariable, 
      "Vestland": _vestlandLocalVariable,
      "Viken": _vikenLocalVariable, 
    };
    
    
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