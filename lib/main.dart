import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_pad_app/constants/constants.dart';
import 'package:flutter_note_pad_app/crud_screens/view_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          appBarTheme: const AppBarTheme(
            backgroundColor: AppUtils.primaryColor,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: AppUtils.primaryColor)),

      ///home
      home: const ViewScreen(),
    );
  }
}
