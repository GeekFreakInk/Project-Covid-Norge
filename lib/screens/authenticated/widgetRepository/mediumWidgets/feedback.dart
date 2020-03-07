import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormData extends StatelessWidget{
  final void Function (int index) onChanged;
  final int value;
  final Widget filledStar;
  final Widget unfilledStar;

  @override
  Widget build(BuildContext context) {
    final size = 36.0;
    final color = Theme.of(context).accentColor;
    return Form(
      child: Column(
        children: <Widget>[
          Align(alignment: Alignment.centerRight, 
          child: Row(mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index){
              return IconButton(
                onPressed: onChanged != null ? (){
                  onChanged(value == index +1 ? index : index +1);
                } : null,
                color: index < value ? color : null,
                iconSize: size,
                icon: index < value ? filledStar ?? Icon(Icons.star) : unfilledStar ?? Icon(Icons.star_border),
              );
            }),
          ),),
          TextFormField(
            decoration: InputDecoration(
            border: OutlineInputBorder(),
             labelText: "Tittel"
            ),
            validator: (value) {
              if (value.isEmpty){
                return "Please enter some text";
              }
              return null;
            },
          ),
          SizedBox(height: 50),
          TextFormField(
            maxLines: 8,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Melding"
            ),
            validator: (value) {
              if (value.isEmpty){
                return "Please enter some text";
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          Align(alignment: Alignment.bottomRight, 
          child: RaisedButton(
            onPressed: (){},
            child: Text("Send"),
            color: Colors.green,
          ),), 
        ],
      ),
    );
  }
  const FormData({
    Key key, 
    this.onChanged,
    this.value = 0,
    @required this.unfilledStar, 
    @required this.filledStar,
  }) : assert(value != null), super(key: key);
}

class StarDisplay extends FormData{
  const StarDisplay({Key key, int value = 0}) 
  : super(
    key : key,
    value : value,
    filledStar : const Icon(Icons.star),
    unfilledStar: const Icon(Icons.star_border),
  );
}

class FeedbackWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   int rating = 0;
    return StatefulBuilder(
      builder: (context, setState){
        return FormData(
          onChanged : (index) {
            setState((){
              rating = index;
            });
          },
          value : rating, filledStar: null, unfilledStar: null,
        );
      }
    );
  }
} 