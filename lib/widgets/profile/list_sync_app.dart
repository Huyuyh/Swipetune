import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:swipetune/widgets/profile/sync_app.dart';

class ListSyncApp extends StatelessWidget {
  const ListSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SyncApp(),
        SyncApp(),
        SyncApp()

      ],
    );
  }
}