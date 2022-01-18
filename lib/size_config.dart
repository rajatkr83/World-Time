import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeVertical;
  static double blockSizeHorizontal;


  //data members for safeArea
  static double _safeAreaVertical;
  static double _safeAreaHorizontal;
  static double safeBlockHorizontal;
  static double safeBlockVertical;



  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;


    //member function for safeArea
    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}