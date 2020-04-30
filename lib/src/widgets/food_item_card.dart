import 'package:flutter/material.dart';

import 'blue_button.dart';

class FoodItemCard extends StatelessWidget {

  final String title;
  final String description;
  final double price;
 
 FoodItemCard(this.title,this.price,this.description) ;

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.all(14.0),
                height: 120.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0, 5),
                          color: Colors.grey)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 80.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/lunch.jpeg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                offset: Offset(0, 5),
                                color: Colors.grey)
                          ]),
                    ),
                    Column(
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("$title",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold)),
                        SizedBox(height:5.0),
                        Container(
                          
                          width: 220.0,
                          child: Text(
                              "$description",
                              style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height:10,
                        ),
                        Container(
                          width: 200.0,
   
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Rs.$price/-",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                              BlueButton(
                                btntext: "Buy",
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
  }
}