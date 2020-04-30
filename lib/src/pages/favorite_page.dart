import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/src/models/food_model.dart';
import 'package:fooddeliveryapp/src/scoped_model/main_model.dart';
import 'package:fooddeliveryapp/src/widgets/blue_button.dart';
import 'package:fooddeliveryapp/src/widgets/food_item_card.dart';
import 'package:scoped_model/scoped_model.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({Key key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:ScopedModelDescendant(builder: (BuildContext context,Widget child,MainModel model){
            model.fetchfoods();
            List<Food>foods=model.foods;
            return  Container(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: ListView(
              children: foods.map((Food food){
                return FoodItemCard(
                  food.name,
                  food.price,
                  food.description
                );
              }).toList(),
          ),
            );
          


        })); 
        
  }
}
