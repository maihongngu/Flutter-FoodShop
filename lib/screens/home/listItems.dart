import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/getFoodList.dart';


class ListItems extends StatefulWidget 
{
  final Size size;

  ListItems
  (
    {
      Key key,
      @required this.size
    }
  ) : super ( key : key );
  
  // This widget is the root of your application.
  @override
  _ListItems createState() => _ListItems(size);
  // #endregion 
}


class _ListItems extends State<ListItems>
{
  Size size;

  _ListItems(this.size);

  
  @override
  Widget build(BuildContext context)
  {
    return Container
    (
      height: size.height * 0.8,  
      child:  FutureBuilder
      (
        future: getFoodList(),
        builder: (context , foodSnap)
        {
          if(foodSnap.hasData || foodSnap.connectionState == ConnectionState.done)
          {
            return GridView.count
            (
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: <Widget>
              [
                for( int i =0 ; i < 6 ; i ++)
                  Container
                  (
                    padding: EdgeInsets.all(36),
                    child: Image.network(foodSnap.data[1].url.toString()),
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

