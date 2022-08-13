import '../../backend/backend.dart';
import '../../muallim/muallim_theme.dart';
import '../../muallim/muallim_util.dart';
import 'index.dart'; // Imports other actions
import '../../muallim/muallim_functions.dart'; // Imports functions
import 'package:flutter/material.dart';

Future<dynamic> getCurrentData(String choosenPage) async {
  String pageNum = choosenPage.toLowerCase().replaceAll(' ', '');
  print(MWAppState().qaida[pageNum]);
  return MWAppState().qaida[pageNum];
}
