import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/utils/color_manager.dart';

import 'package:tour_guide/features/notifications/view/widgets/notification_body_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: ColorManager.beigeColor,
            height: 100.h,
          ),
        ),
        const Expanded(
          child: NotificationBodyScreen(),
        ),
      ],
    );
  }
}
