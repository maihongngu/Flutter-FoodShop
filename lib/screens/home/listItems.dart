
import 'package:FoodShopApp/models/foodlist.dart';
import 'package:FoodShopApp/screens/home/cardlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ListItems extends StatefulWidget 
{
  final Size size;
  final Function press;
  final Future<List<FoodList>> foodList;
  final int number;
  final Widget fab;
  ListItems
  (
    {
      Key key,
      @required this.size,
      this.press,
      @required this.foodList,
      this.number,
      this.fab
    }
  ) : super ( key : key );
  
  // This widget is the root of your application.
  @override
  _ListItems createState() => _ListItems(size,press,foodList,number,fab);
  // #endregion 
}


class _ListItems extends State<ListItems>
{
  Widget fab;
  int length; 
  int number;
  Size size;  
  Function press;
  Future<List<FoodList>> foodList;

  _ListItems(this.size,this.press,this.foodList,this.number,this.fab);

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
                //     child: Card
                //     (
                //       shape: BeveledRectangleBorder
                //       (
                //         borderRadius: BorderRadius.circular(15.0),
                //       ),
                //       color: kMainColor,
                //       child: Container
                //       (
                //         width: 150,
                //         decoration: BoxDecoration
                //         (
                //           borderRadius: BorderRadius.all(Radius.circular(100))
                //         ),
                //         child: Column
                //         (
                //           children: <Widget>
                //           [
                //             Image.network
                //             (
                //               foodSnap.data[i].url.toString() ,
                //               height: MediaQuery.of(context).size.height * 0.25 - 100,
                //               width: MediaQuery.of(context).size.width -20,
                //             ),
                //             Spacer(),
                //             Center
                //             (
                //               child : Row
                //               (
                //                 children: <Widget>
                //                 [
                //                   Spacer(),
                //                   SizedBox
                //                   (
                //                     width: MediaQuery.of(context).size.width * 0.175 -30,
                //                     child: RaisedButton
                //                     (
                //                       color: kButtonColor,
                //                       shape: RoundedRectangleBorder
                //                       (
                //                         borderRadius: BorderRadius.circular(100)
                //                       ),
                //                       child: Align
                //                       (
                //                         alignment: Alignment.center,
                //                         child: Text
                //                         (
                //                           "+",
                //                           style: TextStyle
                //                           (
                //                             fontSize: 16,
                //                           ),
                //                         ),
                //                       ),
                //                       onPressed: () =>
                //                       {
                //                         addtoCart(foodSnap.data[i]),
                //                         press()
                //                       },
                //                     ),
                //                   ),
                //                   Spacer(),
                //                   Text
                //                   (
                //                     getItemInCart(foodSnap.data[i].id).toString(),
                //                     style: TextStyle
                //                     (
                //                       color: Colors.white,
                //                       fontSize: 15
                //                     ),
                //                   ),
                //                   Spacer(),
                //                   SizedBox
                //                   (
                //                     width: MediaQuery.of(context).size.width * 0.175 -30,
                //                     child: RaisedButton
                //                     (
                //                       color: kButtonColor,
                //                       shape: RoundedRectangleBorder
                //                       (
                //                         
                //                         borderRadius: BorderRadius.circular(36)
                //                       ),
                //                       child: Align
                //                       (
                //                         alignment: Alignment.center,
                //                         child: Text
                //                         (
                //                           "-",
                //                           style: TextStyle
                //                           (
                //                             fontSize: 16,
                //                           ),
                //                         ),
                //                       ),
                //                       onPressed: () =>
                //                       {
                //                         removefromcart(foodSnap.data[i].id),
                //                         press()
                //                       },
                //                     ),
                //                   ),
                //                   Spacer(),
                //                 ],
                //               ),
                //             )
                //           ],
                //         )
                //       ),
                //     ),
                //  
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

