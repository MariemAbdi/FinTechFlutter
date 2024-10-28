import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomStyle {
  static const primaryColorLight = Color(0xFFFD4F36);
  static const footerColorLight = Color(0xFFffefea);
  // static const darkGray = Color(0xFF969598);
  // static const primaryFontColorLight = Color(0xFF010002);
  // static const secondaryFontColorLight = Color(0xFF020104);

  //#f0f6fe  #5ca7fe  #fffbec  #b58d0b  #ffebf5 #ff096f
  static const primaryFontColorLight = Color(0xFF181818);
  static const white = Color(0xFFffffff);

  static final lightTheme = ThemeData.light().copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: white,

      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero)
        ),
        width: double.infinity
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return primaryColorLight; // When hovered
            }
            return primaryFontColorLight; // By default
          }),
          foregroundColor: MaterialStateProperty.all<Color>(white), // Always white text
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50), // Adjust the radius as needed
            ),
          ),
        )),

      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return primaryColorLight; // When hovered
              }
              return white; // By default
            }),
            foregroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return white; // Return the hover text color
              }
              return primaryFontColorLight; // Return the default text color
            }),
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
            ),
            side: MaterialStateProperty.resolveWith((states){
              if(states.contains(MaterialState.hovered)){
                return const BorderSide(color: primaryColorLight);
              }
              return const BorderSide(color: primaryFontColorLight, width: 1.5);
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50), // Adjust the radius as needed
              ),
            ),
          )),

      textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent), // Ensure no gray overlay
        foregroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return primaryColorLight; // Return the hover text color
          }
          return primaryFontColorLight; // Return the default text color
        }),
        textStyle: MaterialStateProperty.all(const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
      )),

      textTheme: GoogleFonts.archivoTextTheme().apply(
        displayColor: primaryColorLight,
        bodyColor: primaryFontColorLight
      )
  );
}
