import 'package:flutter/material.dart';

import '../widgets/order_card.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
            backgroundColor: Colors.black,
            title:Text("Your Orders & Cart",style:TextStyle(color:Colors.white,),),
            centerTitle: true,
            elevation: 0.0,
          ),
      
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          OrderCard(),
          OrderCard(),
          OrderCard(),
          OrderCard(),
          OrderCard(),
          
        ],
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: _buildCheckout(),
    );
  }

Widget _buildCheckout() {
  return Container(
    height: 210,
    margin: EdgeInsets.only(top:20.0,left: 10,right: 10),
      child: Column(
        children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Text("Total Cart",style: TextStyle(color:Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold),),
        Text("20",style: TextStyle(color:Colors.yellowAccent,fontSize: 16.0,fontWeight: FontWeight.bold),),
     
      ],
       ),
       SizedBox(height:10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Text("Discount",style: TextStyle(color:Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold),),
        Text("2",style: TextStyle(color:Colors.yellowAccent,fontSize: 16.0,fontWeight: FontWeight.bold),),
     
      ],
       ),
         SizedBox(height:10.0),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Text("GST",style: TextStyle(color:Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold),),
        Text("6",style: TextStyle(color:Colors.yellowAccent,fontSize: 16.0,fontWeight: FontWeight.bold),),
     
      ],
       ),

         Divider(height:20.0,color:Colors.white),

       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Text("Sub Total",style: TextStyle(color:Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold),),
        Text("24",style: TextStyle(color:Colors.yellowAccent,fontSize: 16.0,fontWeight: FontWeight.bold),),
     
      ],
       ),
       SizedBox(height:20),
       Container(
         width:260.0,
         height:50.0,
         decoration:BoxDecoration(
           color:Colors.green,
           borderRadius: BorderRadius.circular(30.0),
         ),
         child:Center(
           child: Text("Proceed to Checkout",
           style:TextStyle(
             color:Colors.white,
             fontSize: 20,
             fontWeight: FontWeight.bold
           ),
           ),
         )
       )
    ],
  ));
}
}