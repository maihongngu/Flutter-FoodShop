import 'package:FoodShopApp/models/products.dart';
import 'package:FoodShopApp/screens/home/cardlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ListItems extends StatefulWidget 
{
  final Size size;
  final Function press;
  final Future<List<Products>> products;
  final int number;
  final Widget fab;
  ListItems
  (
    {
      Key key,
      @required this.size,
      this.press,
      @required this.products,
      this.number,
      this.fab
    }
  ) : super ( key : key );
  
  // This widget is the root of your application.
  @override
  _ListItems createState() => _ListItems(size,press,products,number,fab);
  // #endregion 
}


class _ListItems extends State<ListItems>
{
  Widget fab;
  int length; 
  int number;
  Size size;  
  Function press;
  Future<List<Products>> products;

  _ListItems(this.size,this.press,this.products,this.number,this.fab);

  @override
  Widget build(BuildContext context)
  {
    return Container
    (
      height: size.height * 0.8,  
      child:  FutureBuilder
      ( 
        initialData: [],
        future: products,
        builder: (context , foodSnap)
        {
          if(foodSnap.hasData || foodSnap.connectionState == ConnectionState.done)
          {
            if( foodSnap.data.length > 6)
            {
              length = 6;
            }
            else
            {
              length = foodSnap.data.length;
            }
            return GridView
            (
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
              (
                crossAxisCount: 2,
              ) ,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>
              [
                for( int i =0 ; i < length ; i ++)
                  GestureDetector
                  (
                    onTap: () => 
                    {
                      showDialog
                      (
                        context: context,
                        builder:  ( context  )
                        {
                          return AlertDialog
                          (
                            content: CardItems
                            (
                              key: UniqueKey(),
                              foodSnap: foodSnap,
                              index: i,
                              press: press,
                            )
                          );
                        }
                      )
                    },
                    child: CardItems
                    (
                      foodSnap: foodSnap,
                      index: i,
                      press: press,
                    ),
                 )
              ],
            );
          }
          return Center
          (
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}

