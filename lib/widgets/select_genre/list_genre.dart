import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'genre.dart';

class ListGenre extends StatefulWidget {
  const ListGenre({super.key});

  @override
  State<ListGenre> createState() => _ListGenreState();
}

class _ListGenreState extends State<ListGenre> {
  List<int> arr = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap( 
        spacing: 12,
        runSpacing: 50,
        children: [
          Genre(),
        ],
      ),
    );
  }
}