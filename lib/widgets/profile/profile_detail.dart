import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:swipetune/widgets/profile/avatar.dart';
import 'package:swipetune/widgets/profile/custom_texfield.dart';
import 'package:swipetune/widgets/profile/date_input.dart';
import 'package:swipetune/widgets/profile/sync_area.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 600,
              child: Column(
                children: [
                  CustomTextField(label: "Full name", hintText: "Type your name", initialValue: "Pham Ho Minh Huy",),
                  DateInput(),
                  CustomTextField(label: "Phone", hintText: "Type your phone number"),
                  SyncArea(),
                ],
              ),
            );
  }
}