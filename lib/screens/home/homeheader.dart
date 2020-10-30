import 'package:FoodShopApp/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class HeaderBody extends StatefulWidget 
{
  final Size size;

  HeaderBody
  (
    {
      Key key,
      @required this.size
    }
  ) : super ( key : key );
  
  // This widget is the root of your application.
  @override
  _HeaderBody createState() => _HeaderBody(size);
  // #endregion 
}

class _HeaderBody extends State<HeaderBody>
{
  Size size ;
  _HeaderBody(this.size);
  // #endregion

  @override
  Widget build(BuildContext context )
  {
    // #region header
    return Container
    (
      padding: EdgeInsets.only
      (
        left: 40
      ),
      height: size.height * 0.2 -50,
      decoration: BoxDecoration
      (
        color: kMainColor,
        borderRadius: BorderRadius.only
        (
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25)
        ),
      ),
      child: Row
      (
        children : <Widget>
        [
          SvgPicture.asset
          (
            ("assets/images/logo-full.svg"),
            height: 50,
          ),
          Spacer(),
          Text
          (
            "Anflash",
            
            style : TextStyle
            ( 
              color: HexColor("##F9DC5C"),
              fontSize: 20,  
            )
          ),
        ],  
      ),
    );
  }
}