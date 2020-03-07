import 'package:flutter/material.dart';

class _SearchBarState extends State<SearchBar>{
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  Icon _searchIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("Searchbar");
  }
}

class SearchBar extends StatefulWidget{
  @override
  _SearchBarState createState() => new _SearchBarState();
}