
import 'package:FoodShopApp/components/constants.dart';
import 'package:FoodShopApp/components/getProducts.dart';
import 'package:FoodShopApp/models/category.dart';
import 'package:FoodShopApp/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SwipeList extends StatefulWidget
{
  final Size size;
  final Future<List<Category>> category;
  final Future<List<Products>> product ;
  SwipeList
  (
    {
      Key key,
      @required this.size , 
      this.category,
      this.product
    }
  );

  _SwipeList createState() => _SwipeList(size , category , this.product);
}


class _SwipeList extends State<SwipeList>
{
  Size size;
  Future<List<Category>> category ;
  Future<List<Products>> product ;

  _SwipeList(this.size,this.category,this.product);

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
                          setState(() 
                          {
                            product = getProducts(foodSnap.data[i].id, "");
                            List<Products> list = List<Products>();
                            print(list.length);
                          });
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

                  