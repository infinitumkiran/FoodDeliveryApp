import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/src/models/food_model.dart';
import 'package:fooddeliveryapp/src/scoped_model/main_model.dart';
import 'package:fooddeliveryapp/src/widgets/button.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodItem extends StatefulWidget {
  AddFoodItem({Key key}) : super(key: key);

  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {

  String title;
  String description;
  String price;
  String discount;
  String category;
  GlobalKey<FormState> _fooditemkey = GlobalKey();  
  GlobalKey<FormState> _scaffoldStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldStateKey,
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.symmetric(vertical:60.0,horizontal:16.0),
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Form(
            key: _fooditemkey,
            child: Column(

              children: <Widget>[
                
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 170.0,
                  margin: EdgeInsets.only(bottom: 15.0),
                 
                  decoration: BoxDecoration(
                    image:DecorationImage(image:  AssetImage("assets/images/noimage.png"),),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                ),

                _buildTextFormField("Food Title"),
                _buildTextFormField("Category"),
                _buildTextFormField("Description",maxlines: 3),
                _buildTextFormField("Price"),
                _buildTextFormField("Discount"),
                SizedBox(height: 50.0,),
                ScopedModelDescendant(builder: (BuildContext context,Widget child,MainModel model){
                  return  GestureDetector
                (
                  onTap: () {
                     onsubmit(model.addFood);
                     if(model.isLoading){
                        showloadinindicator();
                     }
                  },
                  child: Button(btnText: "Add Food Item")
                );
                }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }



  void onsubmit(Function addFood) async
  {
    if (_fooditemkey.currentState.validate()) {
                      _fooditemkey.currentState.save();

                      final Food food=Food(
                        name: title,
                        category: category,
                        description:description,
                        price:double.parse(price),
                        discount: double.parse(discount),
                        
                      );
                        
                         var value= await addFood(food);
                         if(value){
                           Navigator.of(context).pop();
                           SnackBar  snackBar=SnackBar(content: 
                           Text("Fooditem is added successfully."),
                           );
                         Scaffold.of(context).showSnackBar(snackBar);
                         }
                         else if(!value){
                            Navigator.of(context).pop();
                           SnackBar  snackBar=SnackBar(content: 
                           Text("Fooditem is added successfully."),
                           );
                           
                         Scaffold.of(context).showSnackBar(snackBar);
                         }                     

                    }
 
  }

  Future<void> showloadinindicator(){
    return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context){
      return AlertDialog(
        content: Row(
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(width: 10.0,),
            Text("Adding food item")
          ],
        ),
      );
    }
    );
  }




  Widget _buildTextFormField(String hint,{int maxlines}){
    return TextFormField(
      
      decoration: InputDecoration(hintText: "$hint"),
      maxLines: maxlines,
      keyboardType: hint == "Price" || hint== "Discount" ? TextInputType.number: TextInputType.text ,
      validator: (String value) {
        var errormsg="";
        if(value.isEmpty&&hint=="Food Title"){
          return "FoodTitle is required"; 
        }        
        if(value.isEmpty&&hint=="Category"){
          return "Category is required"; 
        }        
        if(value.isEmpty&&hint=="Description"){
          return "Description is required"; 
        }        
        if(value.isEmpty&&hint=="Price"){
          return "Price is required"; 
        }        
        
        // return errormsg;
      },
      onChanged: (String value) {

        if(hint=="Food Title"){
          title=value;

        }
        
        if(hint=="Category"){
          category=value;

        }
        
        if(hint=="Description"){
          description=value;

        }
        
        if(hint=="Price"){
          price=value;

        }
        
        if(hint=="Discount"){
          discount=value;

        }
      },
    );
  }
}
