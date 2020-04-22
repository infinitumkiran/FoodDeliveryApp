import 'package:flutter/material.dart';

class HomeTopInfo extends StatelessWidget {
  const HomeTopInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final textstyle=TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold,color:Colors.white);
    return  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(" What would",style: textstyle,),
                  Text(" you like to eat?",style: textstyle,)
                ],
              ),
            Icon(Icons.notifications_none,size: 50.0,color: Theme.of(context).primaryColor,)
            ],
          );
  }
}