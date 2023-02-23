import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/values_manager.dart';

class ThemeManager {
  static ThemeData themeData() {
    return ThemeData(
      scaffoldBackgroundColor: ColorManager.scaffoldColor,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.white,
        titleTextStyle: TextStyle(
          color: ColorManager.black,
          fontSize: FontSize.s24,
          fontWeight: FontWeightManager.bold,
        ),
        elevation: AppSize.s0,
      ),
      cardColor: ColorManager.white,
      textTheme: TextTheme(
        titleMedium: TextStyle(
          color: ColorManager.black,
          fontWeight: FontWeightManager.semiBold,
          fontSize: FontSize.s22,
        ),
        labelSmall: TextStyle(
          color: ColorManager.black,
          fontWeight: FontWeightManager.bold,
          fontSize: FontSize.s16,
        ),
        headlineMedium: TextStyle(
          color: ColorManager.black,
          fontWeight: FontWeightManager.semiBold,
          fontSize: FontSize.s20,
        ),
        bodyMedium: TextStyle(
          color: ColorManager.black,
          fontWeight: FontWeightManager.normal,
          fontSize: FontSize.s18,
        ),
      ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ColorManager.deepOrange,
      ),
      // input decoration theme (text form field)
      inputDecorationTheme: const InputDecorationTheme(
        // content padding
        contentPadding: EdgeInsets.all(
          AppPadding.p8,
        ),
        // hint style
        hintStyle: TextStyle(color: ColorManager.grey, fontSize: FontSize.s16),
        // label style
        labelStyle: TextStyle(color: ColorManager.grey, fontSize: FontSize.s16),
        errorStyle: TextStyle(color: ColorManager.red, fontSize: FontSize.s16),
        // enabled border style
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.grey,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppSize.s8,
            ),
          ),
        ),
        // focused border style
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.deepOrange,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppSize.s8,
            ),
          ),
        ),
        // error border style
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.red,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppSize.s8,
            ),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.deepOrange,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppSize.s8,
            ),
          ),
        ),
      ),
    );
  }
}
