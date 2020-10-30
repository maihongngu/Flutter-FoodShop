
import 'package:FoodShopApp/components/constants.dart';
import 'package:FoodShopApp/components/getCategories.dart';
import 'package:FoodShopApp/components/getlistCart.dart';
import 'package:FoodShopApp/models/category.dart';
import 'package:FoodShopApp/screens/home/listItems.dart';
import 'package:FoodShopApp/screens/home/swipeList.dart';
import 'package:FoodShopApp/screens/home/titleItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import '../appbar.dart';
import 'homeheader.dart';


class HomeScreen extends StatefulWidget
{
  @override
  _HomeSceen createState() => _HomeSceen();
}

class _HomeSceen extends State<HomeScreen>
{
  // #region property
  Future<List<Category>> list = getCategories();
  int number ;
  GlobalKey<ScaffoldState> _scaffold = GlobalKey();
  // #endregion

  // #region Appbar custom

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
        getlistCart().toString()
      ),
    ),
    icon : Icon
    (
      Icons.add_shopping_cart ,
      size: 30,
    ),
  ); 
  
  _fabChange() async
  {
    setState(() =>
    {
      fab = FloatingActionButton.extended
      (
        backgroundColor: kMainColor,
        key: UniqueKey(),
        onPressed: () => 
        {
        },
        label: Align
        (
          alignment: Alignment.centerLeft,
          child: Text
          (
            getlistCart().toString()
          ),
        ),
        icon : Icon
        (
          Icons.add_shopping_cart ,
          size: 30,
        ),
      )
    });
  }
  
  // #region State
    void initState()
    {
      super.initState();
    }
  // #endregion

  @override
  Widget build (BuildContext context) 
  {
    Size size = MediaQuery.of(context).size;
    //Start coding ...
    return new Scaffold
    (
      appBar:searchBar.build(context),

      key: _scaffold,
      floatingActionButton: fab,
      body: SingleChildScrollView
      (
        child : Column
        (
          children : <Widget>
          [
            HeaderBody(size: size),
            Container
            (
              child: Column
              (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  SwipeList(size: size , category: list,),
                  TitleItems(category: list,),
                  ListItems
                  (
                    size: size,
                    press: () => 
                    {
                      _fabChange()
                    },
                    category: list,
                    number: number,
                  ),
                ],
              ),
            )
          ]
        ),
      )
    );
  }
}