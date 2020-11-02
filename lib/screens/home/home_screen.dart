
import 'package:FoodShopApp/components/constants.dart';
import 'package:FoodShopApp/components/getCategories.dart';
import 'package:FoodShopApp/components/getProducts.dart';
import 'package:FoodShopApp/components/getCart.dart';
import 'package:FoodShopApp/models/category.dart';
import 'package:FoodShopApp/models/products.dart';
import 'package:FoodShopApp/screens/cart/cart_screen.dart';
import 'package:FoodShopApp/screens/home/components/getupdateProducts.dart';
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
  final String categoryId;

  HomeScreen
  (
    {
      Key key,
      this.categoryId
    }
  ) : super (key : key);
  @override
  _HomeSceen createState() => _HomeSceen(categoryId);
}

class _HomeSceen extends State<HomeScreen>
{
  String categoryId;
  // #region property
  Future<List<Category>> listcategories ;
  Future<List<Products>> listproducts ;
  int number ;
  GlobalKey<ScaffoldState> _scaffold = GlobalKey();
  // #endregion
  // #region Appbar custom

  _HomeSceen(this.categoryId) 
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
        countlistCart().toString()
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
          Navigator.push
          ( 
            context,
            MaterialPageRoute
            (
              builder: (context) => new CartScreen(),
            )
          )
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
      )
    });
  }
  // #endregion 

  

  @override
  void initState()
  {
    listcategories = getCategories();

    if(categoryId == null || categoryId =="" )
    {
      listproducts=  getProducts("1","");
    }
    else
    {
      listproducts = getProducts(categoryId, "");
    }
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
                  SwipeList
                  (
                    size: size , 
                    category: listcategories,
                    presstoLoad: (item)
                    {
                      setState(() 
                      {
                        listproducts = getProducts(item,"");
                      });
                    },

                  ),

                  TitleItems
                  (
                    category: listcategories,
                  ),

                  FutureBuilder
                  (
                    future: listproducts,
                    builder: (context, AsyncSnapshot snapshot)
                    {
                      return UpdateListItems 
                      (
                        key: UniqueKey(),
                        listProducts: snapshot.data,
                        child: ListItems
                        (
                          products: listproducts,
                          number: number,
                          press: () =>
                          {
                            _fabChange()
                          },
                          size: size,
                        ),
                      );
                    },
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