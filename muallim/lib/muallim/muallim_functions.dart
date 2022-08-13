import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:muallim/muallim/muallim_util.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String getArabicVerion(String ascii) {
  // takes in ascii and converts it into arabic letter
  // ex: "&#1601 &#1614 &#1573" -> فَإ
  String temp = ascii;
  if (temp != null && temp.length > 0 && temp[temp.length - 1] == ";") {
    temp = temp.substring(0, temp.length - 1);
  }
  String maped = temp?.split(';')?.map((charCode) {
    return String.fromCharCode(int.parse(charCode.replaceAll('&#', '')));
  })?.join('');

  return maped;
}

String getAudioURL(String verseKey) {
  // returns audio url based on verse ker

  // https://everyayah.com/data/Ayman_Sowaid_64kbps/001002.mp3

  List<String> verseKeys = verseKey.split(":");

  String chapter = verseKeys[0];
  String verse = verseKeys[1];

  String ch = "";
  if (chapter.length == 1) {
    ch += "00" + chapter;
  } else if (chapter.length == 2) {
    ch += "0" + chapter;
  } else if (chapter.length == 3) {
    ch += chapter;
  }

  String ver = "";
  if (verse.length == 1) {
    ver += "00" + verse;
  } else if (verse.length == 2) {
    ver += "0" + verse;
  } else if (verse.length == 3) {
    ver += verse;
  }

  String url =
      "https://everyayah.com/data/Ayman_Sowaid_64kbps/" + ch + ver + ".mp3";

  return url;
}

List<String> getPageNumbers() {
  // gives page nums up to 604 to populate drop down
  List<String> pageNums = [];
  for (int i = 1; i < 605; i++) {
    pageNums.add(i.toString());
  }
  return pageNums;
}

double toDouble(String size) {
  return double.parse(size);
}
