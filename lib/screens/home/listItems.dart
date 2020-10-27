// #region List Items
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/getFoodList.dart';

Widget _listItems(Size size)
{
  FutureBuilder
  (
    future: getFoodList(),
    initialData: [],
    builder: (context , foodSnap)
    {
      if(foodSnap.hasData || foodSnap.connectionState == ConnectionState.done)
      {
        return Container(height: size.height *0.3,  child:  GridView.count
        (
          crossAxisCount: 2,
          children: <Widget>
          [
            for( int i =0 ; i < 6 ; i ++)
              Container
              (
                padding: EdgeInsets.all(10),
                child: Image.network(foodSnap.data[1].url.toString()),
              )
          ],
        ));
      }
      return Center
      (
        child: CircularProgressIndicator(),
      );
    },
  );
} // #endregion