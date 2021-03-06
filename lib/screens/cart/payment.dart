import 'package:FoodShopApp/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Payment extends StatefulWidget
{
  final Size size ;
  Payment
  (
    {
      Key key,
      this.size
    }
  ) : super ( key : key);
  @override
  _Payment createState() => _Payment(size);
}

class _Payment extends State<Payment>
{
  Size size;
  _Payment(this.size);

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector
    (
      onTap: () 
      {
        showDialog
        (
          context: context,
          builder: (BuildContext context)
          {
            return AlertDialog
            (
              actions: <Widget>
              [
                RaisedButton
                (
                  onPressed: () 
                  {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close),
                )
              ],
              content: Stack
              (
                children: <Widget>
                [
                  Column
                  (
                    children: <Widget>
                    [
                      Container
                      (
                        decoration: BoxDecoration
                        (
                          color: kMainColor,
                          borderRadius: BorderRadius.circular(36)
                        ),
                        child: Align
                        (
                        
                          alignment: Alignment.center,  
                          child: Text
                          (
                            "Payment",
                            style: TextStyle
                            (
                              color: HexColor("##F9DC5C"),
                              fontSize: 25
                            ),

                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }
        );
      },
      child : Container
      (
        padding: EdgeInsets.only
        (
          left: 10,
          right: 10
        ),
        height: size.height *0.05 + 20,
        width: size.width *0.6 - 50,
        decoration: BoxDecoration
        (
          borderRadius: BorderRadius.circular(36),
          color: kMainColor,
        ),
        child: Align
        (
          alignment: Alignment.center,
          child: Row
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              Icon
              (
                Icons.payment,
                color: HexColor("##F9DC5C"),
              ),
              Align
              (
                alignment: Alignment.center,
                child : Text
                (
                  "Total : number",
                  style: TextStyle
                  (
                    color: HexColor("##F9DC5C"),
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}