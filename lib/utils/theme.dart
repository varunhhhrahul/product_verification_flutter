import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import '../helpers/custom_route.dart';

final ThemeData theme = _buildCustomTheme();

ThemeData _buildCustomTheme() {
  return customThemeFoundation;
}

ThemeData customThemeFoundation = ThemeData(
  primarySwatch: ColorConstants.PRIMARY,
  accentColor: ColorConstants.SECONDARY,
  fontFamily: 'OpenSans',
  scaffoldBackgroundColor: Color(0xffF7F7F7),
  backgroundColor: Color(0xffF7F7F7),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CustomPageTransitionBuilder(),
      TargetPlatform.iOS: CustomPageTransitionBuilder(),
    },
  ),
  textTheme: ThemeData.light().textTheme.copyWith(
        overline: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 20.0,
          color: Colors.white,
          shadows: [
            Shadow(
              color: ColorConstants.PRIMARY,
              blurRadius: 2.0,
              offset: Offset(
                1.0,
                3.5,
              ),
            )
          ],
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xffF7F7F7),
    textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 4.0,
            color: Colors.white,
          ),
        ),
  ),
);
