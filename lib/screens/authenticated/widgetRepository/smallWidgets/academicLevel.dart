import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _AcademicLevelState extends State<AcademicLevel>{
  Item selectedLanguage;
  String setLanguage;
  bool result;
  List<Item> levels = <Item>[
    const Item('Norsk',Icon(Icons.school, color:  const Color(0xFF167F67),)),
    const Item('Engelsk',Icon(Icons.school, color:  const Color(0xFF167F67),)),
    const Item('Kinesisk',Icon(Icons.school, color:  const Color(0xFF167F67),)),
  ];

  @override
  void initState() {
    super.initState();
    fetchLanguagePrefrences();
  }
  @override
  Widget build(BuildContext context) {
      if(result != null){
        switch (setLanguage){
          case 'Norsk':
          {
          selectedLanguage =levels[0];
          }
          break;
          case "Engelsk":
          {
            selectedLanguage =levels[1];
          }
          break;
          case "Kinesisk":
          {
            selectedLanguage =levels[2];
          }
          break;
        }
      
        return DropdownButton<Item>(
        hint: Text("Velg språk"),
        value: selectedLanguage,
        onChanged: (Item value){
          setState(() {
            selectedLanguage = value;
          });
          _updateValue("preferedLanguage",value.language);
        },
        items: levels.map((Item level){
          return DropdownMenuItem<Item>(
            value: level,
            child: Row(
              children: <Widget>[
                level.icon,
                SizedBox(width: 10,),
                Text(level.language, style: TextStyle(color: Colors.black),),
              ],
            ),
          );
        }
      ).toList());
    }else{
      return DropdownButton<Item>(
        hint: Text("Velg språk"),
        value: selectedLanguage, onChanged: (Item value) {},
      );
    }
  }
   

  Future<void> _updateValue(String prefString, String setting) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefString, setting);
    await fetchLanguagePrefrences();
  }


  Future<void> fetchLanguagePrefrences() async{
    final prefs = await SharedPreferences.getInstance();
  
    String _preferedLanguage = prefs.getString('preferedLanguage');
  _preferedLanguage == null ? await prefs.setString('preferedLanguage', "Norsk") : _preferedLanguage;

    setState(() {
      setLanguage = _preferedLanguage;
      result = true;
    });
    
  }
}




class AcademicLevel extends StatefulWidget{
  @override
  _AcademicLevelState createState() => new _AcademicLevelState();
}

class Item{
  const Item(this.language, this.icon);
  final String language;
  final Icon icon;
}