import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:swipetune/widgets/profile/list_sync_app.dart';
import 'package:swipetune/widgets/profile/title.dart';

class SyncArea extends StatelessWidget {
  const SyncArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TitleSyncApp(),
          SizedBox(height: 10,),
          ListSyncApp()
        ],
      ),
    );
  }
}