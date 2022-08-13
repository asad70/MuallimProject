import '../../backend/backend.dart';
import '../../muallim/muallim_theme.dart';
import '../../muallim/muallim_util.dart';
import 'index.dart'; // Imports other actions
import '../../muallim/muallim_functions.dart'; // Imports functions
import 'package:flutter/material.dart';

Future<DocumentReference> getDocument(String studentUsername) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final docRef = firestore.collection("studentsUsers").doc(studentUsername);
  print(docRef);
  return docRef;
}
