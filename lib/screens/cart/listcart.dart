import 'package:FoodShopApp/components/constants.dart';
import 'package:FoodShopApp/components/getCart.dart';
import 'package:FoodShopApp/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListCart extends StatefulWidget
{
  final Size size;
  ListCart
  (
    {
      Key key,
      this.size
    }
  ) : super (key : key );
  @override
  _ListCart createState() => _ListCart(size);
}

class _ListCart extends State<ListCart>
{
  Size size;
  _ListCart(this.size);
  
  List<Products> temp = cartList;   
  itemsCartLength()
  {
    for(int i = 0 ; i < temp.length ; i ++)
    {
      int count =0;
      cartList.forEach
      (
        (element) 
        {
          if(temp[i].id ==element.id  )
          {
            count ++;
            if(count >1 && temp.length >1) 
            {
              temp.remove(temp[i]);
            }
          }
        }
      );
    }
    return temp;
  }

  @override
  Widget build(BuildContext context)
  {
    return Container
    (
      height: size.height *0.6 ,
      
      child : ListView
      (
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        //physics: const NeverScrollableScrollPhysics(),
        children: <Widget>
        [
          for ( int i = 0 ; i < cartList.length ; i ++)
            //if( cartList.where((element) => element.id == cartList[i].id).length == 1 ||  )  
            Card
            (
              shape: BeveledRectangleBorder
              (
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: kMainColor,
              child: Row
              (
                children: <Widget>
                [
                  Image.network
                  (
                    cartList[i].image,
                    height: 120 ,
                    width: 100,
                  ),
                  Spacer(),
                  Align
                  (
                    alignment: Alignment.centerRight,
                    child: Container
                    (
                      padding: EdgeInsets.only
                      (
                        left: 10,
                        right: 10
                      ),
                      child: Row
                      (
                        children: <Widget>
                        [
                          SizedBox
                          (
                            width: size.width *0.1,
                            child: RaisedButton
                            (
                              color: kButtonColor,
                              shape: RoundedRectangleBorder
                              (
                                borderRadius: BorderRadius.circular(100)
                              ),
                              onPressed: () 
                              {
                                setState(() =>
                                {
                                  addtoCart(cartList[i])
                                });
                              },
                              child: Text
                              (
                                "+",
                                style: TextStyle
                                (
                                  color: Colors.white,
                                  fontSize: 25
                                ),
                              ),
                            ),
                          ),
                          Container
                          (
                            padding: EdgeInsets.only
                            (
                              left: 10,
                              right: 10
                            ),
                            child: Text
                            (
                              getItemInCart(int.parse(cartList[i].id)).toString(),
                              style: TextStyle
                              (
                                color: Colors.white,
                                fontSize: 25
                              ),
                            ),
                          ),
                          SizedBox
                          (
                            width: size.width *0.1,
                            child: RaisedButton
                            (
                              color: kButtonColor,
                              shape: RoundedRectangleBorder
                              (
                                borderRadius: BorderRadius.circular(100)
                              ),
                              onPressed: () 
                              { 
                                setState(() =>
                                {
                                  removefromcart(int.parse(cartList[i].id)),
                                });
                              },
                              child: Text
                              (
                                "-",
                                style: TextStyle
                                (
                                  color: Colors.white,
                                  fontSize: 25
                                ),
                              ),
                            ),
                          ),
                        ]
                      ),
                    )
                  )
                ],
              ),
            ),
        ],
      )
    );
  }
}