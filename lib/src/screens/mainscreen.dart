import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/src/pages/order_page.dart';
import 'package:fooddeliveryapp/src/scoped_model/food_model.dart';
import 'package:fooddeliveryapp/src/scoped_model/main_model.dart';
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import '../pages/profile_page.dart';
import '../pages/favorite_page.dart';



class MainScreen extends StatefulWidget {
  final MainModel model;

  MainScreen({this.model});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Widget currentPage;

  HomePage homePage; 
  OrderPage orderPage;
  FavoritePage favpage;
  ProfilePage propage;



  List<Widget>pages;
  int currenttabindex=0;

  void initState(){
    // widget.foodModel.fetchfoods();
     widget.model.fetchfoods();
    super.initState();
    homePage=HomePage();
    orderPage=OrderPage();
    favpage=FavoritePage();
    propage=ProfilePage();
    pages=[homePage,orderPage,favpage,propage];
    currentPage=homePage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:new Theme(
        data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
        canvasColor: Colors.green,
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        primaryColor: Colors.green,
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.white))),
            child:BottomNavigationBar(
        onTap: (int index){
          setState((){
            currenttabindex=index;
            currentPage=pages[index];
          });

        },
        backgroundColor: Colors.black,
        currentIndex: currenttabindex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
        icon: Icon(Icons.home),
        activeIcon: Icon(Icons.home,color: Colors.yellow,),
        title: Text("Home")
      
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        activeIcon: Icon(Icons.shopping_cart,color: Colors.white70),
        title: Text("Orders")
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        activeIcon: Icon(Icons.favorite,color: Colors.red,),
        title: Text("Favorite") 
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.person),
        activeIcon: Icon(Icons.person,color: Colors.blue,),
        title: Text("Profile")
        ),
      ]),
      ),
      body: currentPage,
      
      );
  }
}