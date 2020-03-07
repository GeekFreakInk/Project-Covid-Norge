import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:Covid_Norge/services/API.dart';
import 'package:Covid_Norge/shared/app_localization.dart';

class Discussion extends StatefulWidget{

  @override
  _DiscussionState createState() => new _DiscussionState();

}

class _DiscussionState extends State<Discussion>{

TextEditingController _textFieldController = TextEditingController();
 var comments = [];
 int id = 1;
  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Text(AppLocalizations.of(context).translate("post_"), style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(width: 25,),
          SizedBox(
            width: 50,
            height: 50,
            child: FloatingActionButton(
              backgroundColor: Colors.deepOrangeAccent,
              child: Text("+"),
              elevation: 0,
              onPressed: () => {
               Alert(context: context, title: AppLocalizations.of(context).translate("newPost_"), 
                content: Container(
                height: 300,
                child:TextField(
                  autofocus: false,
                  controller: _textFieldController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  maxLines: null,
                  ),
                ),
                buttons: [
                  DialogButton(
                    color: Colors.deepOrangeAccent,
                    child: Text(AppLocalizations.of(context).translate("publicize_"), style: TextStyle(color: Colors.white),), onPressed: ()=> {
                    _writePost(_textFieldController.text, comments.length),
                    Navigator.pop(context),
                    _textFieldController.clear(),
                  }),
                ]).show()  
              },
            ),
          )
        ],),
        Divider(thickness: 1.5,),
        for(var comment in comments)
          Column(children: <Widget>[
            SizedBox(height: 5,),
            Container(child: 
              Card(
              color: Colors.white60,
              shape: Border(left: BorderSide(color: Colors.deepOrangeAccent, width: 3.5)),
              elevation: 5,
    
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(25), child:  Align(alignment: Alignment.topLeft, child: Text(comment["comment"]),),),                 
                  SizedBox(height: 15,),
                  Align(alignment: Alignment.bottomRight, child: Text(AppLocalizations.of(context).translate("posted_")+" "+comment["posted"]),)
                  ],  
                ),
              )
            ),           
          ],
        ),    
      ],
    );
  }

  void _writePost(String text, id) async{
    await writePost(text, id);
    _fetchPosts();
  }

  void _fetchPosts() async{
    comments = [];
    var commentList = [];
    var fetchedContent = await fetchPosts();
    for (var i = fetchedContent.length - 1; i > -1; i--){
     commentList.add(fetchedContent[i]);
    }
    setState(() {
      comments = commentList;
    });
  }    
}