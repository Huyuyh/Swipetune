import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlineButtonLarge extends StatelessWidget {
  const OutlineButtonLarge(
      {Key? key, this.onTap, required this.label, this.iconData, this.color, this.border, this.fontsize})
      : super(key: key);

  final VoidCallback? onTap;
  final String label;
  final IconData? iconData;
  final Color? color;
  final Border? border;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color ?? Colors.amber.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: border
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.start,

          children: [
            if (iconData == null) Container() else Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(iconData, color: Colors.white)),
            ),
            Center(
              child: Text(label, style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: fontsize ?? 20,
              ),),
            )
          ],
        ),
      ),
    );
  }
}