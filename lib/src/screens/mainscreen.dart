import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/src/admin/pages/add_food_item.dart';
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
     widget.model.fetchFoods();
    super.initState();
    homePage=HomePage();
    orderPage=OrderPage();
    favpage=FavoritePage(model: widget.model);
    propage=ProfilePage();
    pages=[homePage,favpage,orderPage,propage];
    currentPage=homePage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color:Colors.white),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            ListTile(
              onTap:() {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context)=> AddFoodItem())
                  );
              },
              leading:Icon(Icons.list),
              title:Text("Add Food Item",style:TextStyle(fontSize:16.0))
            )
          ],
        ),
      ),
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
        backgroundColor: Colors.black54,
        currentIndex: currenttabindex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
        icon: Icon(Icons.home),
        activeIcon: Icon(Icons.home,color: Colors.orange,),
        title: Text("Home")
      
        ),
         BottomNavigationBarItem(
        icon: Icon(Icons.explore),
        activeIcon: Icon(Icons.explore,color: Colors.blue,),
        title: Text("Explore") 
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        activeIcon: Icon(Icons.shopping_cart,color: Colors.white70),
        title: Text("Orders")
        ),
       
        BottomNavigationBarItem(
        icon: Icon(Icons.person),
        activeIcon: Icon(Icons.person,color: Colors.yellow,),
        title: Text("Profile")
        ),
      ]),
      ),
      body: currentPage,
      
      );
  }
}