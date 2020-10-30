
import 'package:FoodShopApp/components/constants.dart';
import 'package:FoodShopApp/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SwipeList extends StatefulWidget
{
  final Size size;
  final Future<List<Category>> category;
  SwipeList
  (
    {
      Key key,
      @required this.size , 
      this.category
    }
  );

  _SwipeList createState() => _SwipeList(size , category);
}


class _SwipeList extends State<SwipeList>
{
  Size size;
  Future<List<Category>> category ;
  _SwipeList(this.size,this.category);

  @override
  Widget build(BuildContext context )  
  { 
    // #region List Swipe 
    return Container
    (
      height: size.height * 0.25,
      child: Stack
      (
        children: <Widget>
        [
          FutureBuilder 
          (
            future: category,
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
                    for(int i =0 ; i < foodSnap.data.length ; i++)
                      new GestureDetector
                      ( 
                        onTap: () 
                        {
                          final snackBar = SnackBar
                          (
                            content: Text(i.toString()),
                            
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        },
                        child : Card
                        (
                          shape: BeveledRectangleBorder
                          (
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: kMainColor,
                          child: Container
                          (
                            // margin: EdgeInsets.only
                            // (
                            //   top: 0
                            // ),
                            width: MediaQuery.of(context).size.width - 50,
                            decoration: BoxDecoration
                            (
                              image: DecorationImage
                              (
                                image: NetworkImage(foodSnap.data[i].image.toString() ,),
                                fit: BoxFit.fill
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(36))
                            ),
                            // child: Column
                            // (
                            //   children: <Widget>
                            //   [
                            //     // Image.network
                            //     // (
                            //     //   
                            //     //   height: MediaQuery.of(context).size.height * 0.17,
                            //     //   //width: MediaQuery.of(context).size.width ,
                            //     // ),
                            //     Spacer(),
                            //     Center
                            //     (
                            //       child: Align
                            //       (
                            //         alignment: Alignment.center,
                            //         child: Text
                            //         (
                            //           foodSnap.data[i].title,
                            //           style: TextStyle
                            //           (
                            //             color: Colors.white,
                            //             fontSize: 25
                            //           ),
                            //         )
                            //       )
                            //     ),
                            //     
                            //   ],
                            // )
                          ),
                        )
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
    );
    // #endregion
  }
}

                  