import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PixelTheme {
  static const Color darkBackground = Color(0xFF040608);
  static const Color surfaceDark = Color(0xFF0B1018);
  static const Color borderDark = Color(0xFF1F2A3C);
  static const Color neonCyan = Color(0xFF32F5FF);
  static const Color neonMagenta = Color(0xFFEC3AFF);
  static const Color neonLime = Color(0xFFB2FF59);
  static const Color neonPurple = Color(0xFF9B6BFF);

  static ThemeData buildTheme() {
    final baseTextTheme = GoogleFonts.shareTechMonoTextTheme();
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: neonCyan,
        secondary: neonMagenta,
        surface: surfaceDark,
        background: darkBackground,
      ),
      scaffoldBackgroundColor: darkBackground,
      textTheme: baseTextTheme.copyWith(
        displayLarge: baseTextTheme.displayLarge?.copyWith(
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: baseTextTheme.headlineMedium?.copyWith(
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(height: 1.6),
        labelLarge: baseTextTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceDark,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderDark, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderDark, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: neonCyan, width: 2),
        ),
        labelStyle: TextStyle(color: neonLime),
      ),
      cardTheme: const CardTheme(
        color: surfaceDark,
        elevation: 0,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: surfaceDark,
        elevation: 0,
        titleTextStyle: baseTextTheme.titleLarge?.copyWith(
          color: neonCyan,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: neonCyan,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
      ),
    );
  }
}
