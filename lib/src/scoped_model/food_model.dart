import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import '../models/food_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model{
  List<Food> _foods=[];

  List<Food>get foods{
    return List.from(_foods);
  }

  void addFood(Food food){
    _foods.add(food);
  }
  
  void fetchfoods(){
    http.get("http://192.168.0.4/flutter_food_app/api/foods/get_foods.php")
    .then((http.Response response) {
     print("datacheck: ${response.body}");
     final List fetcheddata = json.decode(response.body);
     final List<Food> fetchedfooditems=[];
     
      fetcheddata.forEach((val) {
     
        Food food=Food(

          id:val["id"],
          category: val["category_id"],
          discount: double.parse(val["discount"]),
          imagePath: "assets/images/"+val["image_path"],
          name: val["title"],
          price:double.parse(val["price"]),
          // ratings: val["ratings"]
        );
          fetchedfooditems.add(food);
       });
     _foods=fetchedfooditems; 
    

    }).catchError((error) {
      print('There is an error');
     
      notifyListeners();
     
    });
  }

}