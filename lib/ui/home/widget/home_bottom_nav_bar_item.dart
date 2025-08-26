import 'package:flutter/cupertino.dart';

final class HomeBottomNavBarItem extends BottomNavigationBarItem {
  static Container _buildIcon(
    String activeAsset,
    String inactiveAsset,
    double iconWidth,
    double iconHeight,
    double marginTop,
    double marginBottom,
  ) {
    return Container(
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      child: Image.asset(activeAsset, width: iconWidth, height: iconHeight),
    );
  }

  HomeBottomNavBarItem({
    required String label,
    required String activeAsset,
    required String inactiveAsset,
    double iconWidth = 18,
    double iconHeight = 18,
    double marginTop = 20,
    double marginBottom = 5,
  }) : super(
         label: label,
         icon: _buildIcon(
           inactiveAsset,
           inactiveAsset,
           iconWidth,
           iconHeight,
           marginTop,
           marginBottom,
         ),
         activeIcon: _buildIcon(
           activeAsset,
           inactiveAsset,
           iconWidth,
           iconHeight,
           marginTop,
           marginBottom,
         ),
       );
}
