
import 'package:FoodShopApp/components/constants.dart';
import 'package:FoodShopApp/models/foodlist.dart';
import 'package:FoodShopApp/screens/home/components/getFoodList.dart';
import 'package:FoodShopApp/screens/home/components/getlistCart.dart';
import 'package:FoodShopApp/screens/home/listItems.dart';
import 'package:FoodShopApp/screens/home/swipeList.dart';
import 'package:FoodShopApp/screens/home/titleItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'header.dart';


class HomeScreen extends StatefulWidget
{
  @override
  _HomeSceen createState() => _HomeSceen();
}

class _HomeSceen extends State<HomeScreen>
{
  // #region property
  SearchBar searchBar;
  // #endregion

  // #region Appbar custom
  AppBar appbar(BuildContext context) 
  {
    return new AppBar
    (
      //Style
      backgroundColor: kMainColor,
      elevation: 0,

      
      //tittle
      centerTitle: true,
      title: new Text('Food Shop tutorial'),

      //Action
      actions: 
      [
        searchBar.getSearchAction(context),
      ]
    );
  } 

  _HomeSceen() 
  {
    searchBar = new SearchBar
    (
      inBar: false,
      setState: setState,
      onSubmitted: print,
      buildDefaultAppBar: appbar
    );
  }
  // #endregion
  
  //State
  int number ;
  Future<List<FoodList>> list = getFoodList();

  @override
  void initState()
  {
    super.initState();
    number = getlistCart();
  }


  @override
  Widget build (BuildContext context) 
  {
    // #region Property
    Size size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> _scaffold = GlobalKey();
    // #endregion

    //Start coding ...
    return new Scaffold
    (
      appBar:searchBar.build(context),

      key: _scaffold,
      floatingActionButton: Stack
      (
        alignment: Alignment.bottomRight,
        children : <Widget>
        [
          FloatingActionButton.extended
          (
            backgroundColor: kMainColor,
            label: Align
            (
              alignment: Alignment.centerLeft,
              child: Text
              (
                number.toString()
              ),
            ),
            onPressed: null,
            icon : Icon
            (
              Icons.add_shopping_cart ,
              size: 30,
            ), 
          )
        ]
        
      ),
      
      
      body: SingleChildScrollView
      (
        child : Column
        (
          children : <Widget>
          [
            HeaderBody(size: size,),
            Container
            (
              child: Column
              (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  SwipeList(size: size , foodList: list,),
                  TitleItems(),
                  ListItems
                  (
                    size: size,
                    // press: ()
                    // {
                    //   _increment(); 
                    // },
                    foodList: list,
                    number: number,
                  ) 
                ],
              ),
            )
          ]
        ),
      )
    );
  }
}