
import 'package:FoodShopApp/components/constants.dart';
import 'package:FoodShopApp/models/foodlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
        IconButton
          (
            icon: new Icon
            (
              Icons.add_shopping_cart ,
              size: 30,
            ), 
            onPressed: () => 
            {

            },
          )
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

  // #region FetchData FoodList

  final String apiUrl ="https://jsonplaceholder.typicode.com/posts";

  Future<List<FoodList>> getFoodList() async 
  {
    
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) 
    {
      var parsedFoodList = json.decode(response.body);
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

  @override
  Widget build (BuildContext context) 
  {
    //Property
    Size size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> _scaffold = GlobalKey();

    //Start coding ...
    return new Scaffold
    (
      appBar:searchBar.build(context),

      key: _scaffold,
      body: Column
      (
        children: <Widget>
        [
          Container
          (
            padding: EdgeInsets.only
            (
              left: 40
            ),
            height: size.height * 0.2 -50,
            decoration: BoxDecoration
            (
              color: kMainColor,
              borderRadius: BorderRadius.only
              (
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
              ),
            ),
            child: Row
            (
              children : <Widget>
              [
                SvgPicture.asset
                (
                  ("assets/images/logo-full.svg"),
                  height: 50,
                ),
                Spacer(),
                Text
                (
                  "Anflash",
                  
                  style : TextStyle
                  ( 
                    color: HexColor("##F9DC5C"),
                    fontSize: 20,  
                  )
                ),
              ],  
            ),
          ),
          
          //body
          Expanded
          (
            child: Column
            (
              children: <Widget>
              [
                //List Swipe 
                Container
                (
                  height: size.height * 0.25,
                  child: Stack
                  (
                    children: <Widget>
                    [
                      FutureBuilder 
                      (
                        future: getFoodList(),
                        initialData: [],
                        builder: (context , foodSnap)
                        {
                          if(foodSnap.connectionState == ConnectionState.done || foodSnap.hasData)
                          {
                            return ListView
                            (
                              padding: EdgeInsets.only
                              (
                                left: 10,
                                right: 10,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>
                              [
                                for(int i =0 ; i< foodSnap.data.length ; i++)
                                  Card
                                  (
                                    shape: BeveledRectangleBorder
                                    (
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    color: kMainColor,
                                    child: Container
                                    (
                                      
                                      width: 150,
                                      decoration: BoxDecoration
                                      (
                                        borderRadius: BorderRadius.all(Radius.circular(100))
                                      ),
                                      child: Center
                                      (
                                        child: Stack
                                        (
                                          children: <Widget>
                                          [
                                            Center
                                            (
                                              child: Align
                                              (
                                                alignment: Alignment.center,
                                                child: Text
                                                (
                                                  foodSnap.data[i].title.toString(),
                                                  style: TextStyle
                                                  (
                                                    color: Colors.white,
                                                  ),
                                                )
                                              )
                                            )
                                          ],
                                        )
                                      ),
                                    ),
                                  )
                              ],
                            );
                          }
                          return Center
                          (
                            child :  CircularProgressIndicator() 
                          );
                        },
                      )
                    ],
                  )
                )
              ],
            )
          )
        ],
      ),
    );
  }
}