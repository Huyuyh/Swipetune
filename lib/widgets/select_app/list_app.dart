import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:swipetune/widgets/select_app/app.dart';

class ListApp extends StatefulWidget {
  const ListApp({super.key});

  @override
  State<ListApp> createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap( 
        spacing: 12,
        runSpacing: 50,
        children: [
          App(),
          App(),
          App(),
          App(),
          App(),
          App(),
          App(),
          App(),
          App(),       
        ],
      ),
    );
  }
}