import 'package:flutter/material.dart';
import 'package:flutter_note_pad_app/constants/constants.dart';
import 'package:flutter_note_pad_app/crud_screens/view_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///title
      title: 'NotePad',

      ///debugShowCheckedModeBanner
      debugShowCheckedModeBanner: false,

      ///theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppUtils.primaryColor),
        useMaterial3: true,
        primaryColor: AppUtils.primaryColor,
        fontFamily: GoogleFonts.getFont('lato').fontFamily,
      ),

      ///home
      home: ViewScreen(),
    );
  }
}
