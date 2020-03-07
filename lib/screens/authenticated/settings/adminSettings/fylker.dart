import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Covid_Norge/services/database.dart';

class _FylkerState extends State<Fylker>{

  bool _agder = false;
  bool _innlandet = false ;
  bool _moreOgRomsdal = false;
  bool _nordland = false;
  bool _oslo = false;
  bool _rogaland = false;
  bool _tromsOgFinnmark = false;
  bool _trondelag = false;
  bool _vestfoldOgTelemark = false;
  bool _vestland = false;
  bool _viken = false;
  bool result;

  @override
  void initState() {
    super.initState();
    displayAreas();
  }
  @override
  Widget build(BuildContext context) {
    if(result != null){
         return ListView(children: <Widget>[
        Align(alignment: Alignment.center, child: Text('Fylker', style: TextStyle(fontWeight: FontWeight.bold),),),
        SizedBox(height: 50,),
         Column(children: <Widget>[
          SwitchListTile(title: Text("Agder"),
           value: _agder, 
           onChanged: (bool value) { setState(() {
             _agder = value;
           });
           updateValues("agderToggle", _agder);},
           ), Divider(thickness: 2,),
          SwitchListTile(title: Text("Innlandet"),
           value: _innlandet, 
           onChanged: (bool value) { setState(() {
             _innlandet = value;
           });
           updateValues("innlandetToggle", _innlandet);},
           ), Divider(thickness: 2,),
            SwitchListTile(title: Text("Møre og Romsdal"),
           value: _moreOgRomsdal, 
           onChanged: (bool value) { setState(() {
             _moreOgRomsdal = value;
           });
           updateValues("moreOgRomsdalToggle", _moreOgRomsdal);},
           ), Divider(thickness: 2,),
          ],),
           SwitchListTile(title: Text("Nordland"),
           value: _nordland, 
           onChanged: (bool value) { setState(() {
             _nordland = value;
           });
           updateValues("nordlandToggle", _nordland);},
           ), Divider(thickness: 2,),
            SwitchListTile(title: Text("Oslo"),
           value: _oslo, 
           onChanged: (bool value) { setState(() {
             _oslo = value;
           });
           updateValues("osloToggle", _oslo);},
           ), Divider(thickness: 2,),
            SwitchListTile(title: Text("Rogaland"),
           value: _rogaland, 
           onChanged: (bool value) { setState(() {
             _rogaland = value;
           });
           updateValues("rogalandToggle", _rogaland);},
           ), Divider(thickness: 2,),
            SwitchListTile(title: Text("Troms og Finnmark"),
           value: _tromsOgFinnmark, 
           onChanged: (bool value) { setState(() {
             _tromsOgFinnmark = value;
           });
           updateValues("tromsOgFinnmarkToggle", _tromsOgFinnmark);},
           ), Divider(thickness: 2,),
            SwitchListTile(title: Text("Trøndelag"),
           value: _trondelag, 
           onChanged: (bool value) { setState(() {
             _trondelag = value;
           });
           updateValues("trondelagToggle", _trondelag);},
           ), Divider(thickness: 2,),
            SwitchListTile(title: Text("Vestfold og Telemark"),
           value: _vestfoldOgTelemark, 
           onChanged: (bool value) { setState(() {
             _vestfoldOgTelemark = value;
           });
           updateValues("vestfoldOgTelemarkToggle", _vestfoldOgTelemark);},
           ), Divider(thickness: 2,),
            SwitchListTile(title: Text("Vestland"),
           value: _vestland, 
           onChanged: (bool value) { setState(() {
             _vestland = value;
           });
           updateValues("vestlandToggle", _vestland);},
           ), Divider(thickness: 2,),
            SwitchListTile(title: Text("Viken"),
           value: _viken, 
           onChanged: (bool value) { setState(() {
             _viken = value;
           });
           updateValues("vikenToggle", _viken);},
           ), Divider(thickness: 2,),
      ],);    
    }else{
      return Container(
        color: Colors.white,
        child: Center(child: CircularProgressIndicator(),));
    }     
  }
  
  void displayAreas()async{
    var loadedPrefs = await fetchSavedData();
    setState(() {
      _agder = loadedPrefs["agderToggle"];
      _innlandet = loadedPrefs["innlandetToggle"];
      _moreOgRomsdal =loadedPrefs["moreOgRomsdalToggle"];
      _nordland = loadedPrefs["nordlandToggle"];
      _oslo = loadedPrefs["osloToggle"];
      _rogaland = loadedPrefs["rogalandToggle"];
      _tromsOgFinnmark = loadedPrefs["tromsOgFinnmarkToggle"];
      _trondelag = loadedPrefs["trondelagToggle"];
      _vestfoldOgTelemark = loadedPrefs["vestfoldOgTelemarkToggle"];
      _vestland = loadedPrefs["vestlandToggle"];
      _viken = loadedPrefs["vikenToggle"];
      result = true;
    });
  }  
}

class Fylker extends StatefulWidget{
  @override
  _FylkerState createState() => new _FylkerState();
}