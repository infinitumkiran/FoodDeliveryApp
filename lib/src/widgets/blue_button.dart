import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  
  final String btntext;
  BlueButton({this.btntext});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 60.0,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(20.0)),
      child: Center(
          child: Text("$btntext",
              style: TextStyle(color: Colors.blue, fontSize: 16.0))),
    );
  }
}
