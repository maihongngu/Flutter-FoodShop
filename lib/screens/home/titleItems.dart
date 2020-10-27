// #region Title Items
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

Widget _itemsTitle()
{
  Container
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
// #endregion