import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/src/scoped_model/food_model.dart';
import 'package:fooddeliveryapp/src/scoped_model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'pages/favorite_page.dart';
import 'pages/home_page.dart';
import 'pages/order_page.dart';
import 'pages/profile_page.dart';
import 'screens/mainscreen.dart';

class App extends StatelessWidget {
  final MainModel mainModel = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: mainModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery App',
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home: MainScreen(model:mainModel),
      ),
    );
  }
}
