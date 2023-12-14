import 'package:flutter_note_pad_app/constants/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DataBaseServices {
  ///function to add notes
  static Future<void> addNotes(String title, String details) async {
    await firestore
        .collection('notes')
        .doc()
        .set({'title': title, 'details': details}).whenComplete(() {
      Fluttertoast.showToast(msg: 'Added Successfully');
    });
  }

  ///function to update notes

  static Future<void> updateNotes(
      String title, String details, String id) async {
    await firestore.collection('notes').doc(id).update({
      'title': title,
      'details': details,
    }).whenComplete(() {
      Fluttertoast.showToast(msg: 'Update Successfully');
    });
  }

  ///function to delete notes
  static Future<void> deleteNotes(String id) async {
    await firestore.collection('notes').doc(id).delete().whenComplete(() {
      Fluttertoast.showToast(msg: 'Delete Successfully');
    });
  }
}

/*
  FirebaseFirestore.instance
        .collection('notes')
        .doc()
        .set({'title': title, 'details': details});


        firestore
        .collection('notes')
        .doc(id)
        .update({'title': title, 'details': details}).whenComplete(() {
      Fluttertoast.showToast(msg: 'Update Successfully');
*/