import '../../backend/backend.dart';
import '../../muallim/muallim_theme.dart';
import '../../muallim/muallim_util.dart';
import 'index.dart'; // Imports other actions
import '../../muallim/muallim_functions.dart'; // Imports functions
import 'package:flutter/material.dart';

// Begin action code
Future<String> getStdPassword(String studentUsername) async {
  String password = "";
  await FirebaseFirestore.instance
      .collection('studentsUsers')
      .doc(studentUsername)
      .get()
      .then((value) {
    if (value.data() != null) {
      password = value.data()['password'];
    }
  });
  return password;
}
