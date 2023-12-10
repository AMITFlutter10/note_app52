import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppTheme.primaryColor
      ),
      iconTheme: const  IconThemeData(
          color:  AppTheme.primaryColor
      ),
      buttonTheme:const ButtonThemeData(
          buttonColor: AppTheme.primaryColor
      ),
      scaffoldBackgroundColor: AppTheme.nearlyWhite,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppTheme.secondColor,
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: AppTheme.primaryColor,
        ),
      ),
      dialogBackgroundColor: AppTheme.gray,
      toggleButtonsTheme: const ToggleButtonsThemeData(
          selectedBorderColor: Colors.transparent,
          borderColor: Colors.transparent,
          fillColor: AppTheme.black
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(AppTheme.kPrimaryColor),
        fillColor: MaterialStateProperty.all(AppTheme.textColor),
      )
  );

  static ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: AppTheme.black,
      ),
      iconTheme: const  IconThemeData(
          color:  AppTheme.gray
      ),
      buttonTheme:const ButtonThemeData(
          buttonColor: AppTheme.gray
      ),
      scaffoldBackgroundColor: AppTheme.gray,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppTheme.white,
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: AppTheme.gray,
        ),
      ),
      dialogBackgroundColor: AppTheme.gray2,
      toggleButtonsTheme: const ToggleButtonsThemeData(
          selectedBorderColor: Colors.transparent,
          borderColor: Colors.transparent,
          fillColor: AppTheme.black
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.pink),
        fillColor: MaterialStateProperty.all(AppTheme.textColor),
      )
  );


}