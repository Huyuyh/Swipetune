import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.controller,
      required this.label,
      required this.hintText,
      this.onTap,
      this.onChanged,
      this.readOnly = false,
      this.focusNode,
      this.focused = false,
      this.initialValue, 
      this.floatingLabelBehavior})
      : super(key: key);

  final TextEditingController? controller;
  final String label;
  final String hintText;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final bool? readOnly;
  final FocusNode? focusNode;
  final bool focused;
  final String? initialValue;
  final bool? floatingLabelBehavior;

  Icon? _getRightIcon() {
    if (label == 'Time') {
      return Icon(
        Icons.access_time_rounded,
        color: Colors.grey.withOpacity(0.5),
      );
    }
    if (label == 'Date') {
      return Icon(
        Icons.date_range,
        color: Colors.grey.withOpacity(0.5),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          focusNode: focusNode,
          initialValue: initialValue,
          autofocus: focused,
          readOnly: readOnly as bool,
          maxLines: label == 'Description' ? 5 : 1,
          controller: controller,
          // style: kTextStyleBoldBlack(18),
          onTap: onTap,
          onChanged: onChanged,
          decoration: InputDecoration(
            // contentPadding: const EdgeInsets.all(14),
            labelText: label,
            hintText: hintText,
            floatingLabelBehavior: floatingLabelBehavior != true ? null : FloatingLabelBehavior.always,
            labelStyle: TextStyle(
              color: Color(0xff959595),
              fontSize: 16,
            ),
            // hintStyle: kTextStyleBoldGrey(18),
            suffixIcon: _getRightIcon(),
            border: InputBorder.none,
            enabledBorder: _borders(),
            focusedBorder: _borders(),
            disabledBorder: _borders(),
          ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }

  _borders() {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        width: 2,
        color: Colors.grey,
      ),
    );
  }
}