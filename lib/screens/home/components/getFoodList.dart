 // #region FetchData 

import 'dart:convert';

import 'package:FoodShopApp/models/foodlist.dart';
import 'package:http/http.dart' as http;

final String apiUrl ="https://jsonplaceholder.typicode.com/photos";

  Future<List<FoodList>> getFoodList() async 
  {
    
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) 
    {
      var parsedFoodList = json.decode(response.body);

      //fetch api to model
      List<FoodList> _foodList = List<FoodList>();
      parsedFoodList.forEach
      (
        (values) 
        {
          _foodList.add(FoodList.fromJSON(values));
        }
      );
      return _foodList;
    } 
    else 
    {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load ');
    }
    // var result = await http.get(apiUrl);
    // return json.decode(result.body);
  }
  // #endregion