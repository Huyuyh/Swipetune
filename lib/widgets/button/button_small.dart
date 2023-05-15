import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class SolidButtonSmall extends StatelessWidget {
  const SolidButtonSmall(
      {Key? key, this.onTap, required this.label, this.iconData, this.color})
      : super(key: key);

  final VoidCallback? onTap;
  final String label;
  final IconData? iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        color: color ?? Colors.amber.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData == null) Container() else Icon(iconData),
            Text(label, style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 20,
            ),)
          ],
        ),
      ),
    );
  }
}