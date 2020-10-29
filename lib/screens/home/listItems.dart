import 'package:FoodShopApp/components/constants.dart';
import 'package:FoodShopApp/models/foodlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/getFoodList.dart';


class ListItems extends StatefulWidget 
{
  final Size size;
  final Function press;
  final Future<List<FoodList>> foodList;
  final int number;
  ListItems
  (
    {
      Key key,
      @required this.size,this.press,this.foodList,this.number
    }
  ) : super ( key : key );
  
  // This widget is the root of your application.
  @override
  _ListItems createState() => _ListItems(size,press,foodList,number);
  // #endregion 
}


class _ListItems extends State<ListItems>
{
  void _increment()
  {
    setState(() 
    {
      number ++ ;  
    });
  }
  int length; 
  int number;
  Size size;  
  Function press;
  Future<List<FoodList>> foodList;
  _ListItems(this.size,this.press,this.foodList,this.number);

  @override
  Widget build(BuildContext context)
  {
    

    return Container
    (
      height: size.height * 0.8,  
      child:  FutureBuilder
      (
        initialData: [],
        future: foodList,
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
                                _increment();
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

