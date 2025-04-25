import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tour_guide/features/notifications/view/notifications_screen.dart';
import 'package:tour_guide/features/places/view/places_screen.dart';

class LayoutNavBarScreen extends StatefulWidget {
  const LayoutNavBarScreen({super.key});

  @override
  State<LayoutNavBarScreen> createState() => _LayoutNavBarState();
}

class _LayoutNavBarState extends State<LayoutNavBarScreen> {
  int currentIndex = 3; // Start with home screen
  final List<Widget> screens = [
    const AllPlacesScreen(), // Index 0

    const NotificationsScreen(), // Index 1
    const AllPlacesScreen(), // Index 2
    const AllPlacesScreen(), // Index 3
  ];

  final List<String> labels = [
    'الاعدادات',
    'زياراتي',
    'الاشعارات',
    'الرئيسية',
  ];
  final bool isNotified = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(labels[currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Lottie.asset(
              'assets/lottie/settings.json',
              width: 70.w,
              height: 70.h,
              animate: currentIndex == 0,
            ),
            label: labels[0],
          ),
          BottomNavigationBarItem(
            icon: Lottie.asset(
              "assets/lottie/saved.json",
              width: 70.w,
              height: 70.h,
              animate: currentIndex == 1,
            ),
            label: labels[1],
          ),
          BottomNavigationBarItem(
            icon: isNotified
                ? Lottie.asset(
                    "assets/lottie/noNotifications.json",
                    width: 70.w,
                    height: 70.h,
                    animate: currentIndex == 2,
                  )
                : Lottie.asset(
                    "assets/lottie/notifications.json",
                    width: 70.w,
                    height: 70.h,
                    animate: currentIndex == 2,
                  ),
            label: labels[2],
          ),
          BottomNavigationBarItem(
            icon: Lottie.asset(
              "assets/lottie/trt.json",
              width: 70.w,
              height: 70.h,
              animate: currentIndex == 3,
            ),
            label: labels[3],
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
    );
  }
}
