

import 'package:FoodShopApp/components/constants.dart';
import 'package:FoodShopApp/components/getCart.dart';
import 'package:FoodShopApp/screens/detail/detailheader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'listcart.dart';

class CartScreen extends StatefulWidget
{

  @override
  _CartScreen createState() => _CartScreen();
}

class _CartScreen extends State<CartScreen>
{
  // #region StateFAB
  Widget fab = FloatingActionButton.extended
  (
    backgroundColor: kMainColor,
    onPressed: () => 
    {

    },
    label: Align
    (
      alignment: Alignment.centerLeft,
      child: Text
      (
        countlistCart().toString()
      ),
    ),
    icon : Icon
    (
      Icons.add_shopping_cart ,
      size: 30,
    ),
  ); 
  
  // #endregion 

  @override
  Widget build(BuildContext context)
  {
    Size size = MediaQuery.of(context).size;
    return Scaffold
    (
      floatingActionButton: fab,
      appBar: AppBar
      (
        backgroundColor: kMainColor,
        elevation: 0,
        centerTitle: true,
        title: new Text('Food Shop tutorial'),
      ),

      body: Container
      (
        child: Column
        (
          children: <Widget>
          [
            HeaderDetail(size: size,),
            Column
            (
              
              children: <Widget>
              [
                Align
                (
                  alignment: Alignment.center,
                  child: Text
                  (
                    "List Cart",
                    style: TextStyle
                    (
                      fontSize: 36
                    ),
                  ),
                ),
                ListCart
                (
                  size: size,
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}