import 'package:FoodShopApp/components/constants.dart';
import 'package:FoodShopApp/models/foodlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/getFoodList.dart';


class ListItems extends StatefulWidget 
{
  final Size size;
  final int number;
  ListItems
  (
    {
      Key key,
      @required this.size,this.number
    }
  ) : super ( key : key );
  
  // This widget is the root of your application.
  @override
  _ListItems createState() => _ListItems(size);
  // #endregion 
}


class _ListItems extends State<ListItems>
{
  List<FoodList> _cartList = List<FoodList>();
  Size size;
  int number;
  _ListItems(this.size);

  @override
  Widget build(BuildContext context)
  {
    int length; 
    
    List list = [];

    return Container
    (
      height: size.height * 0.8,  
      child:  FutureBuilder
      (
        initialData: [],
        future: getFoodList(),
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
                      child: Column
                      (
                        children: <Widget>
                        [
                          Image.network
                          (
                            foodSnap.data[i].url.toString() ,
                            height: MediaQuery.of(context).size.height * 0.25 - 100,
                            width: MediaQuery.of(context).size.width -20,
                          ),
                          Spacer(),
                          Align
                          (
                            alignment: Alignment.bottomCenter,
                            child: IconButton
                            (
                              icon: Icon
                              (
                                Icons.add_shopping_cart,
                                color: kButtonColor,
                              ),
                              onPressed: () 
                              {
                                list.add(foodSnap.data[i]);
                                // listCart.albumId = foodSnap.data[i].albumId;
                                // listCart.title = foodSnap.data[i].title;
                                // listCart.url = foodSnap.data[i].url;
                                // listCart.thumbnailUrl = foodSnap.data[i].thumbnailUrl;
                                _cartList.add(foodSnap.data[i]);
                                print(_cartList.length);
                              },
                            )
                          )
                        ],
                      ),
                    )
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

