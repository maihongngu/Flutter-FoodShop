import 'dart:core';


import 'package:FoodShopApp/models/products.dart';

List<Products> _cartList = List<Products>();

addtoCart(dynamic _tempList)
{
  _cartList.add(_tempList);
}
int countlistCart()
{
  return _cartList.length;
  //_cartList.length;
}

int getItemInCart(int id)
{
  int count =0 ;
  for ( int i =0 ; i < _cartList.length ; i++)
  {
    if( int.parse(_cartList[i].id) == id)
    {
      count ++;
    }
  }
  return count;
  //_cartList.length;
}

List<Products> cartList = _cartList;
removefromcart( int id )
{
  final items = _cartList.asMap();  //map cart list
  for( int i =0 ;i < _cartList.length ; i++)
  {
    if(int.parse(_cartList[i].id) == id)
    {
      _cartList.remove(items[i]);
      break;
    }
  }
}