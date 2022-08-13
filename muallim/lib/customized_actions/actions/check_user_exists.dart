import '../../backend/backend.dart';
import '../../muallim/muallim_theme.dart';
import '../../muallim/muallim_util.dart';
import 'index.dart'; // Imports other actions
import '../../muallim/muallim_functions.dart'; // Imports functions
import 'package:flutter/material.dart';

Future<bool> checkUserExists(String username) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Check If Document Exists
  try {
    // Get reference to Firestore collection
    var collectionRef = firestore.collection('studentsUsers');

    var doc = await collectionRef.doc(username).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}
