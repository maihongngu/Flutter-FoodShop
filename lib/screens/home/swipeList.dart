
import 'package:FoodShopApp/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/getFoodList.dart';



Widget _swipeList (Size size )  
{ 
  // #region List Swipe 
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
                                    foodSnap.data[i].title,
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
  );
   // #endregion
}
                  