import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ─── COLORS ───────────────────────────────────────────────
  // Blue Medical Theme
  static const Color primary = Color(0xFF1565C0); // medical blue
  static const Color primaryLight = Color(0xFF42A5F5);
  static const Color primaryDark = Color(0xFF0D47A1);

  static const Color accent = Color(0xFFE3F2FD); // soft blue background
  static const Color accentOrange = Color(0xFF4FC3F7); // cyan accent

  static const Color dark = Color(0xFF102A43); // deep navy
  static const Color darkGrey = Color(0xFF486581);
  static const Color mediumGrey = Color(0xFF829AB1);

  static const Color lightGrey = Color(0xFFF7FAFC);

  static const Color white = Color(0xFFFFFFFF);

  static const Color divider = Color(0xFFD9E2EC);

  static const Color cardBg = Color(0xFFFFFFFF);

  static const Color navBg = Color(0xFFFFFFFF);

  static const Color footerBg = Color(0xFF0B1F33); // dark medical footer

  static const Color heroOverlay = Color(0x66102743);

  static const Color sectionBg = Color(0xFFF0F8FF); // very light blue section

  // ─── TEXT STYLES ──────────────────────────────────────────
  static TextStyle get heading1 => GoogleFonts.playfairDisplay(
    fontSize: 42,
    fontWeight: FontWeight.w700,
    color: dark,
    height: 1.2,
  );

  static TextStyle get heading2 => GoogleFonts.playfairDisplay(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: dark,
    height: 1.3,
  );

  static TextStyle get heading3 => GoogleFonts.playfairDisplay(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: dark,
  );

  static TextStyle get heading4 =>
      GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w700, color: dark);

  static TextStyle get bodyLarge =>
      GoogleFonts.lato(fontSize: 16, color: darkGrey, height: 1.7);

  static TextStyle get bodyMedium =>
      GoogleFonts.lato(fontSize: 14, color: darkGrey, height: 1.6);

  static TextStyle get bodySmall =>
      GoogleFonts.lato(fontSize: 13, color: mediumGrey, height: 1.5);

  static TextStyle get navLabel => GoogleFonts.lato(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: dark,
    letterSpacing: 0.3,
  );

  static TextStyle get buttonText => GoogleFonts.lato(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
    color: white,
  );

  static TextStyle get caption =>
      GoogleFonts.lato(fontSize: 12, color: mediumGrey, letterSpacing: 0.5);

  // ─── DECORATION ──────────────────────────────────────────
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: cardBg,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.07),
        blurRadius: 20,
        offset: const Offset(0, 6),
      ),
    ],
  );

  static BoxDecoration get primaryCardDecoration => BoxDecoration(
    color: primary,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: primary.withOpacity(0.3),
        blurRadius: 20,
        offset: const Offset(0, 6),
      ),
    ],
  );

  // ─── THEME DATA ───────────────────────────────────────────
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: accentOrange,
    ),
    textTheme: GoogleFonts.latoTextTheme(),
    scaffoldBackgroundColor: white,
    appBarTheme: const AppBarTheme(
      backgroundColor: navBg,
      elevation: 0,
      scrolledUnderElevation: 2,
    ),
  );
}
