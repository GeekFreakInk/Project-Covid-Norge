import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _LanguageSelectState extends State<LanguageSelect>{
  bool norwegianVal = false;
  bool englishVal = false;
  bool spanishVal = false;
  bool frenchVal = false;
  bool chineseVal = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        checkBox("Norsk", norwegianVal),
        checkBox("Engelsk", englishVal),
        checkBox("Spansk", spanishVal),
        //checkBox("Fransk", frenchVal),
        checkBox("Kinesisk", chineseVal),
      ]
    );
  }

  
  Widget checkBox(String title, bool boolValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: boolValue,
          onChanged: (bool value){
            setState(() {
              switch (title){
                case "Norsk":
                  norwegianVal = value;
                  break;
                case "Engelsk":
                  englishVal = value;
                  break;
                case "Spansk":
                  spanishVal = value;
                  break;
                case "Fransks":
                  frenchVal = value;
                  break;
                case "Kinesisk":
                  chineseVal = value;
                  break;
              }
            });
          },
        ),
        Text(title),
      ],
    );
  }

}


class LanguageSelect extends StatefulWidget{
  @override
  _LanguageSelectState createState() => new _LanguageSelectState();
}
