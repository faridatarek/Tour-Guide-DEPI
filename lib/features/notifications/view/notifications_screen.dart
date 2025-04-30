import 'package:flutter/material.dart';
import 'package:tour_guide/features/layout/view/widgets/custom_appBar.dart';

import 'package:tour_guide/features/notifications/view/widgets/notification_body_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: CustomAppbar(
            title: "الأشعارات",
          )),
      body: const NotificationBodyScreen(),
    );
  }
}
