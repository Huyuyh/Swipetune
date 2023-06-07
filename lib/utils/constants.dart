import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

AppBarTheme sAppBarTheme() {
  return AppBarTheme(
    backgroundColor: Color(0xfff5f5f5),
    elevation: 0,
  );
}

EdgeInsets sPadding() {
  return EdgeInsets.fromLTRB(24, 0, 24, 0);
}

String formatDate(DateTime date) {
  final formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
  return formatter.format(date.toUtc());
}

 
