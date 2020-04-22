import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/src/widgets/food_category.dart';
import '../widgets/home_top_info.dart';
import '../widgets/search_field.dart';
import '../widgets/bought_foods.dart';
import '../data/food_data.dart';
import '../models/food_model.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Food>_foods=foods;
  void initState() {
    // widget.foodModel.fetchFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:ListView(
        padding: EdgeInsets.only(top:50.0,left:20.0,right:20.0),
        children:<Widget>[
         
         SearchField(),
         SizedBox(height:20.0),
         HomeTopInfo(),
          SizedBox(height:20.0),
         FoodCategory(),
         
         SizedBox(height:20.0),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
           Text("Frequently Bought Foods",
           style: TextStyle(
             fontSize: 18.0,
             fontWeight: FontWeight.bold,
             color:Colors.white,
           ),),
           GestureDetector(
            onTap: (){},
            child: Text("View All",
             style: TextStyle(
               fontSize: 18.0,
               fontWeight: FontWeight.bold,
               color: Colors.orangeAccent
             ),),
           ),
          
         ],),
         SizedBox(height:20.0),
          Column(children: _foods.map(_buildfooditems).toList(),
          )
        ],
      ),

    );
  }
}

Widget _buildfooditems(Food food){
  return Container(
    margin: EdgeInsets.only(bottom:20.0),
    child:BoughtFoods(
      id:food.id,
      name: food.name,
      imagePath: food.imagePath,
      price: food.price,
      category: food.category,
      ratings: food.ratings,
      discount: food.discount,

    ) ,
    );
}