import 'dart:core';

import 'package:FoodShopApp/models/foodlist.dart';

List<FoodList> _cartList = List<FoodList>();

addtoCart(dynamic _temp)
{
   _cartList.add(_temp);
  
  print (_cartList.length);
}
getlistCart()
{
  return _cartList.length;
}