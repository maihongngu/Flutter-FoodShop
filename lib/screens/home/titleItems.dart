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
    return Container
    (
      padding: EdgeInsets.only
      (
        top: 20,
        bottom: 15,
      ),
      child :Align
      (
        alignment: Alignment.center, 
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
      )
    );
  }
}

