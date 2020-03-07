import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _BigCheckboxState extends State<BigCheckbox>{
  bool mathVal = false;
  bool norewegianVal = false;
  bool englishVal = false;
  bool scienceVal = false;

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GridView.count(
        shrinkWrap: true,   
        physics: ClampingScrollPhysics(),  
        primary: false,
        padding: const EdgeInsets.all(2),
        crossAxisCount: 2,
        children: <Widget>[
          checkBox("Matte", mathVal, Icon(Icons.check)),
          checkBox("Norsk", norewegianVal, Icon(Icons.ac_unit)),
          checkBox("Engelsk", englishVal, Icon(Icons.access_alarms)),
          checkBox("Naturfag", scienceVal, Icon(Icons.accessible))
      ])
    ]);
  }
  
  Widget checkBox(String title, bool boolValue, Icon icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: boolValue == false ? Colors.grey[300] : Colors.blueAccent,
            ),
          ),         
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Column(
              children: <Widget>[
                SizedBox(height: 40,),
                icon,
                Text(title)
              ],
            ),
            onTap: (){
            setState(() {
              switch (title){
                case "Matte":
                  mathVal == false ? mathVal = true: mathVal =false;
                  break;
                case "Engelsk":
                  englishVal == false ? englishVal = true : englishVal = false;
                  break;
                case "Norsk":
                  norewegianVal == false ? norewegianVal = true: norewegianVal = false;
                  break;
                case "Naturfag":
                  scienceVal == false ? scienceVal = true: scienceVal = false;
                  break;
              }
            });
          },
        )
        )       
      ],
    );
  }
}



class BigCheckbox extends StatefulWidget{
  @override
  _BigCheckboxState createState() => new _BigCheckboxState();
}