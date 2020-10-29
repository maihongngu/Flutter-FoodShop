import 'dart:core';

import 'package:FoodShopApp/models/foodlist.dart';
import 'package:flutter/cupertino.dart';

List<FoodList> _cartList = List<FoodList>();

addtoCart(dynamic _temp)
{
   _cartList.add(_temp);
  
  print (_cartList.length);
}
int getlistCart()
{
  return _cartList.length;
  //_cartList.length;
}
