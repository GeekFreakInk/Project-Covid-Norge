
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReactionOptions extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(children : <Widget>[
    Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.keyboard_arrow_up),
        tooltip: 'Like',
        onPressed: () {
        }),
        IconButton(
        icon: Icon(Icons.keyboard_arrow_down),
        tooltip: 'Dislike',
        onPressed: () {
        }),
        IconButton(
          icon: Icon(Icons.mode_comment),
          tooltip: 'Comment',
          onPressed: () {
          }),
    ])]);
  }
}