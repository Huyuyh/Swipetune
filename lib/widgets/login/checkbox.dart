import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CheckboxListTile(
        value: false,
        onChanged: (value) {
          
        },
      ),
    );
  }
}