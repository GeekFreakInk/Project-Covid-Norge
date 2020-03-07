import 'package:flutter/material.dart';

class ProfilePictureStandard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Align(alignment: Alignment.center,
       child: ClipRRect(
         borderRadius: BorderRadius.circular(8.0),
         child: Image(image: NetworkImage("https://source.unsplash.com/bkc-m0iZ4Sk/250x250"),
          width: 250,
          height: 250,)),),
      SizedBox(height: 15,),
    
    ],);
  }
}