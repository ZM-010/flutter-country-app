import 'package:arz8_task/utils/app_colors.dart';
import 'package:arz8_task/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final baseLight = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.lightPrimary,
      scaffoldBackgroundColor: AppColors.lightBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        //centerTitle: false,
        titleTextStyle: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w800,
          fontSize: 20,
          color: AppColors.lightText,
        ),
        toolbarTextStyle: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w600,
          fontSize: textSize1,
          color: AppColors.lightText,
        ),
        iconTheme: const IconThemeData(color: AppColors.lightText),
      ),
      textTheme: GoogleFonts.nunitoSansTextTheme().copyWith(
        bodyMedium: GoogleFonts.nunitoSans(
          fontSize: textSize2,
          fontWeight: FontWeight.w600,
          color: AppColors.lightText,
        ),
        bodySmall:GoogleFonts.nunitoSans(
          fontSize: textSize2,
          fontWeight: FontWeight.w300,
          color: AppColors.lightText,
        ),
        bodyLarge: GoogleFonts.nunitoSans(
          fontSize: textSize1,
          fontWeight: FontWeight.w600,
          color: AppColors.darkText,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightPrimary,
        hintStyle: GoogleFonts.nunitoSans(
          fontSize: textSize1,
          fontWeight: FontWeight.w600,
          color: AppColors.lightInputFill,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );

    return baseLight.copyWith(
      colorScheme: baseLight.colorScheme.copyWith(
        primaryFixed: AppColors.lightPrimary,
      ),
    );
  }

  static ThemeData get darkTheme {
    final baseDark = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.darkPrimary,
      scaffoldBackgroundColor: AppColors.darkBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        //centerTitle: false,
        titleTextStyle: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w800,
          fontSize: 20,
          color: AppColors.darkText,
        ),
        toolbarTextStyle: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w600,
          fontSize: textSize1,
          color: AppColors.darkText,
        ),
        iconTheme: const IconThemeData(color: AppColors.darkText),
      ),
      textTheme: GoogleFonts.nunitoSansTextTheme().copyWith(
        bodyMedium: GoogleFonts.nunitoSans(
          fontSize: textSize2,
          fontWeight: FontWeight.w600,
          color: AppColors.darkText,
        ),
        bodySmall:GoogleFonts.nunitoSans(
          fontSize: textSize2,
          fontWeight: FontWeight.w300,
          color: AppColors.darkText,
        ),
        bodyLarge: GoogleFonts.nunitoSans(
          fontSize: textSize1,
          fontWeight: FontWeight.w600,
          color: AppColors.darkText,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkPrimary,
        hintStyle: GoogleFonts.nunitoSans(
          fontSize: textSize1,
          fontWeight: FontWeight.w600,
          color: AppColors.darkInputFill,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );

    return baseDark.copyWith(
      colorScheme: baseDark.colorScheme.copyWith(
        primaryFixed: AppColors.darkPrimary,
      ),
    );
  }
}
