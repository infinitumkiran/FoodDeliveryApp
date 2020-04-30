import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/src/widgets/blue_button.dart';
import 'package:fooddeliveryapp/src/widgets/custom_list_tile.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool turnOnNotification = false;
  bool turnOnLocation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(width: 30.0),
                    Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    SizedBox(width: 20.0),
                    Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60.0),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4.0,
                                offset: Offset(0, 4.0),
                                color: Colors.white)
                          ],
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/breakfast.jpeg",
                              ),
                              fit: BoxFit.cover)),
                      // child: Image.asset("assets/images/turkey.png",fit:BoxFit.cover),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Kiran Sai Abhishek",
                            style:
                                TextStyle(color: Colors.white, fontSize: 24.0)),
                        SizedBox(height: 5.0),
                        Text("+91-9441622267",
                            style: TextStyle(
                                color: Colors.white60, fontSize: 16.0)),
                        SizedBox(height: 20.0),
                        BlueButton(btntext: "Edit",)
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  children: <Widget>[
                    SizedBox(width: 30.0),
                    Text("Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 10.0),
                Card(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          CustomListTile(
                              icon: Icons.location_on, text: "Location"),
                          Divider(
                            height: 10.0,
                            color: Colors.grey,
                          ),
                          CustomListTile(
                              icon: Icons.visibility, text: "Change Password"),
                          Divider(
                            height: 10.0,
                            color: Colors.grey,
                          ),
                          CustomListTile(
                              icon: Icons.shopping_cart, text: "Shipping"),
                          Divider(
                            height: 10.0,
                            color: Colors.grey,
                          ),
                          CustomListTile(icon: Icons.payment, text: "Payment"),
                          Divider(
                            height: 10.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )),
                 SizedBox(height: 30.0),
                Row(
                  children: <Widget>[
                    SizedBox(width: 30.0),
                    Text("Notifications",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
               Card(
                 margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child:Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "App Notification",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Switch(
                              value: turnOnNotification,
                              onChanged: (bool value) {
                                // print("The value: $value");
                                setState(() {
                                  turnOnNotification = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Divider(
                          height: 10.0,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Location Tracking",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Switch(
                              value: turnOnLocation,
                              onChanged: (bool value) {
                                // print("The value: $value");
                                setState(() {
                                  turnOnLocation = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Divider(
                          height: 10.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    ),
               )
              ],
            ),
          ),
        ));
  }
}
