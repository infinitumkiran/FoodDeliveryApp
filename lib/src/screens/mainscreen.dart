import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/src/pages/order_page.dart';
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import '../pages/profile_page.dart';
import '../pages/favorite_page.dart';



class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState((){
            currenttabindex=index;
            currentPage=pages[index];
          });

        },
        currentIndex: currenttabindex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("Home")
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        title: Text("Orders")
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        title: Text("Favorite") 
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text("Profile")
        ),
      ]),
      body: currentPage,
      );
  }
}