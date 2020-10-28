import 'package:FoodShopApp/screens/home/components/getFoodList.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class TitleItems extends StatefulWidget
{


  @override
  _TittleItems createState() => _TittleItems();
  
}

class _TittleItems extends State<TitleItems>
{
  @override
  Widget build(BuildContext context)
  {
    return Stack
    (
      children : <Widget>
      [
        Align
        (
          alignment: Alignment.centerLeft, 
          child: Text
          (
            "Items",
            style: TextStyle
            (
              color: HexColor("#032535"),
              fontSize: 25,
              decoration: TextDecoration.underline
            ),
          ),
        ),
        FutureBuilder
        (
          future: getFoodList(),
          initialData: [],
          builder: (context, snapshot)
          {
            if(snapshot.data.length > 6)
            {
              return Align
              (
                alignment: Alignment.centerRight, 
                child: Text
                (
                  "See more ...",
                  style: TextStyle
                  (
                    color: HexColor("#032535"),
                    fontSize: 25,
                    decoration: TextDecoration.underline
                  ),
                ),
              );
            }
            return Align
            (
              alignment: Alignment.centerRight, 
              child: Text
              (
                "",
                style: TextStyle
                (
                  color: HexColor("#032535"),
                  fontSize: 25,
                  decoration: TextDecoration.underline
                ),
              )
            );
          } ,
        )
      ]
      // padding: EdgeInsets.only
      // (
      //   top: 20,
      //   bottom: 15,
      // ),
      
    );
  }
}

