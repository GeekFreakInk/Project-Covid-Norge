import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class RecoveredStats extends StatefulWidget{

  @override
  _RecoveredStatsState createState() => new _RecoveredStatsState();

}

class _RecoveredStatsState extends State<RecoveredStats> with AutomaticKeepAliveClientMixin<RecoveredStats>, WidgetsBindingObserver{

  Completer<WebViewController> _controller = Completer<WebViewController>();
  String resource;
  final _key = UniqueKey();
  int _stackToView = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch(state){
      case AppLifecycleState.paused:
       super.deactivate();
        break;
      case AppLifecycleState.resumed:
        super.updateKeepAlive();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }
  
  void _handleLoad(String value){
    setState((){
      _stackToView = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return IndexedStack(
        index: _stackToView,
        children: [
          WebView(
          key: _key,
          initialUrl: "https://coronavirus.app/chart/rxSafpWsyKhfkV0HTtb4/recovered?embed=true",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            _controller.complete(webViewController);
          },
          onPageFinished: _handleLoad,
        ),
        Container(
          color: Colors.white,
          child: Center(
            child:Column(children: <Widget>[
              SizedBox(height: 100,),
              CircularProgressIndicator(),
              SizedBox(height: 100,),
              Text("Laster inn data fra klient \n Kan ta noen få sekunder")
            ],),
          ),
        )
      ],
        //floatingActionButton: _bookmarkButton(),
    );
  }  

  @override
  bool get wantKeepAlive => true; 
}