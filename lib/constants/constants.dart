import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppUtils {
  ///primary color
  static const Color primaryColor = Color(0xff1c1c50);
}

///global cloud firestore instance
final FirebaseFirestore firestore = FirebaseFirestore.instance;
