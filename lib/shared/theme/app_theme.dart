import 'package:flutter/material.dart';
import 'package:interview_flutter/shared/res/app_colors.dart';

class AppTheme {
  const AppTheme._();
  static ThemeData lightTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: "WorkSans",
        scaffoldBackgroundColor: AppColors.primary,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          titleTextStyle: TextStyle(
            color: AppColors.onPrimary,
          ),
          centerTitle: false,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.onSecondary,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.onSecondary,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: AppColors.surface,
            fontWeight: FontWeight.w400,
            fontFamily: "WorkSans",
            fontSize: 16,
          ),
          floatingLabelStyle: TextStyle(
            color: AppColors.onSecondary,
            fontWeight: FontWeight.w400,
            fontFamily: "WorkSans",
            fontSize: 11,
          ),
          hintStyle: TextStyle(
            color: AppColors.surface,
            fontWeight: FontWeight.w400,
            fontFamily: "WorkSans",
            fontSize: 16,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.onTextFFEnable,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.onTextFFEnable,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.onSecondary,
              width: 3,
            ),
          ),
        ),
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontSize: 18, // Size for smaller display text
            fontWeight: FontWeight.normal,
            fontFamily: "WorkSans",
            color:
                AppColors.onSurface, // Suitable for reading on all backgrounds
            letterSpacing: 0.4,
          ),
          displayMedium: TextStyle(
            fontSize: 20, // Medium display size
            fontWeight: FontWeight.w500,
            fontFamily: "WorkSans",
            color: AppColors.onPrimary,
            letterSpacing: 0.4,
          ),
          displayLarge: TextStyle(
            fontSize: 24, // Large display size
            fontWeight: FontWeight.w500,
            fontFamily: "WorkSans",
            color: AppColors.onPrimary,
            letterSpacing: 0.4,
          ),

          // Body Texts: Typically used for the main content
          bodySmall: TextStyle(
            fontSize: 14, // Small body text size
            fontFamily: "WorkSans",
            fontWeight: FontWeight.normal,
            color: AppColors.onBackground,
            letterSpacing: 0.2,
          ),
          bodyMedium: TextStyle(
            fontSize: 16, // Regular body text size
            fontWeight: FontWeight.w600,
            fontFamily: "WorkSans",
            color: AppColors.onBackground,
            letterSpacing: 0.2,
          ),
          bodyLarge: TextStyle(
            fontSize: 18, // Large body text size
            fontFamily: "WorkSans",
            fontWeight: FontWeight.bold,
            color: AppColors.onPrimary,
            letterSpacing: 0.2,
          ),
          labelLarge: TextStyle(
            fontSize: 12, // Large body text size
            fontFamily: "Inter",
            fontWeight: FontWeight.w400,
            color: AppColors.onTextFFFocus,
            letterSpacing: 0.2,
          ),
          labelMedium: TextStyle(
            fontSize: 12, // Large body text size
            fontFamily: "Inter",
            fontWeight: FontWeight.normal,
            color: AppColors.onBackground,
            letterSpacing: 0.2,
          ),
        ),
      );
}
