import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  //making the constructor private
  CustomTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    titleLarge: GoogleFonts.rubik(
      fontSize: 36.5,
      fontWeight: FontWeight.bold,
      color: const Color(0x00011333),
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: const Color(0x00011333),
    ),
    labelMedium: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: const Color.fromARGB(43, 47, 49, 51),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    titleLarge: GoogleFonts.rubik(
      fontSize: 36.5,
      fontWeight: FontWeight.bold,
      color: const Color.fromARGB(167, 233, 230, 230),
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: const Color.fromARGB(167, 233, 230, 230),
    ),
    labelMedium: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: const Color.fromARGB(167, 233, 230, 230),
    ),
  );
}
