import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const spotifyClientId = '64a2a8a63cb7433a8f8e5bc11f62e189';
const callbackUrlScheme = 'swipetune';
const clientSecret = 'b0a49f2eab454292bff2c5d5bb7613c3';

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
