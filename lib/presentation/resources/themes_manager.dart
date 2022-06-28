import 'package:advanced_app/presentation/resources/colors_manager.dart';
import 'package:advanced_app/presentation/resources/fonts_manager.dart';
import 'package:advanced_app/presentation/resources/styles_manager.dart';
import 'package:advanced_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getApplicationLightTheme() {
  return ThemeData(
    //Main Colors
    primaryColor: ColorsManager.primary,
    primaryColorLight: ColorsManager.lightPrimary,
    primaryColorDark: ColorsManager.darkPrimary,
    disabledColor: ColorsManager.grey1,
    splashColor: ColorsManager.lightPrimary,

    //CardView Theme
    cardTheme: CardTheme(
      color: ColorsManager.white,
      shadowColor: ColorsManager.grey,
      elevation: AppSize.s4.r,
    ),

    //App Bar Theme
    appBarTheme: AppBarTheme(
      color: ColorsManager.primary,
      centerTitle: true,
      titleTextStyle: getSemiBoldStyle(
          color: ColorsManager.white, fontSize: FontSize.s16.sp),
      elevation: AppSize.s4.r,
      iconTheme: const IconThemeData(
        color: ColorsManager.white,
      ),
    ),

    //Button Theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorsManager.grey,
      padding: EdgeInsets.all(AppPadding.p8.r),
      buttonColor: ColorsManager.primary,
      splashColor: ColorsManager.lightPrimary,
    ),

    //Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorsManager.white,
          fontSize: FontSize.s17.sp,
        ),
        primary: ColorsManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12.r),
        ),
        shadowColor: ColorsManager.grey,
      ),
    ),

    //Text Theme
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(
        color: ColorsManager.darkGrey,
        fontSize: FontSize.s16.sp,
      ),
      titleMedium: getMediumStyle(
        color: ColorsManager.primary,
        fontSize: FontSize.s16.sp,
      ),
      headlineMedium: getRegularStyle(
        color: ColorsManager.darkGrey,
        fontSize: FontSize.s14.sp,
      ),
      bodyLarge: getRegularStyle(color: ColorsManager.grey1),
      bodySmall: getRegularStyle(color: ColorsManager.grey),
      displayLarge: getSemiBoldStyle(
        color: ColorsManager.darkGrey,
        fontSize: FontSize.s16.sp,
      ),
    ),

    //Input Decoration Theme ( Text Form Field )
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8.r),

      // Hint Style
      hintStyle: getRegularStyle(
        color: ColorsManager.grey,
        fontSize: FontSize.s14.sp,
      ),

      // Label Style
      labelStyle: getMediumStyle(
        color: ColorsManager.grey,
        fontSize: FontSize.s14.sp,
      ),

      errorStyle: getRegularStyle(color: ColorsManager.error),

      // Enabled Border
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorsManager.grey, width: AppSize.s1_5.r),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),

      // Focused Border
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorsManager.primary, width: AppSize.s1_5.r),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),

      //Error Border
      errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorsManager.error, width: AppSize.s1_5.r),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),

      //Focused Error Border
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorsManager.primary, width: AppSize.s1_5.r),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),
    ),
  );
}
