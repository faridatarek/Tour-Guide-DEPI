import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/features/layout/view/widgets/custom_appBar.dart';
import 'package:tour_guide/features/notifications/view/notifications_screen.dart';
import 'package:tour_guide/features/places/view/places_screen.dart';
import 'package:tour_guide/features/saved/view/saved.dart';

class LayoutNavBar extends StatefulWidget {
  const LayoutNavBar({super.key});

  @override
  State<LayoutNavBar> createState() => _LayoutNavBarState();
}

class _LayoutNavBarState extends State<LayoutNavBar> {
  List<Widget> screens = [
    const AllPlacesScreen(),
    const NotificationsScreen(),
    const VisitsScreen(),
    const AllPlacesScreen(),
  ];
  int currentIndex = 3;
  final List<String> labels = [
    'الاعدادات',
    'الاشعارات',
    'زياراتي',
    'الرئيسية',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: labels[currentIndex],
      ),
      bottomNavigationBar: CircleNavBar(
        iconCurve: Curves.bounceInOut,

        activeIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        activeIcons: [
          const Icon(Icons.settings,
              color: ColorManager.primaryColor, size: 35), // index 3
          const Icon(Icons.notifications,
              color: ColorManager.primaryColor, size: 35), // index 2
          const Icon(Icons.bookmark_added,
              color: ColorManager.primaryColor, size: 35), // index 1
          Center(
              child: Image.asset(ImagePaths.logoPath,
                  width: 70.w, height: 50.h)), // index 0
        ],
        inactiveIcons: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 6.w, top: 19.h),
            child: Column(
              children: [
                const Icon(Icons.settings,
                    color: ColorManager.brownColor, size: 30),
                Text("الاعدادات",
                    style: TextStyle(
                      color: ColorManager.brownColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ArbFonts',
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 6.w, top: 16.h),
            child: Column(
              children: [
                const Icon(Icons.notifications,
                    color: ColorManager.brownColor, size: 30),
                Text("الاشعارات",
                    style: TextStyle(
                      color: ColorManager.brownColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ArbFonts',
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 6.w, top: 18.h),
            child: Column(
              children: [
                const Icon(Icons.bookmark_added,
                    color: ColorManager.brownColor, size: 30),
                Text("زياراتي",
                    style: TextStyle(
                      color: ColorManager.brownColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ArbFonts',
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 6.w, top: 15.h),
            child: Column(
              children: [
                Center(
                    child: Image.asset(ImagePaths.logoPath,
                        width: 55.w, height: 40.h)),
                Text("الرئيسية",
                    style: TextStyle(
                      color: ColorManager.brownColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ArbFonts',
                    )),
              ],
            ),
          ),
        ],

        color: Colors.red,
        circleColor: Colors.red,
        height: 75,
        circleWidth: 60,

        // tabCurve: ,
        padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),

        circleShadowColor: ColorManager.primaryColor,
        shadowColor: Colors.grey.shade400,

        elevation: 10,
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white,
            Colors.white70,
          ],
        ),
        circleGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorManager.primaryColor,
            ColorManager.primaryColor,
            ColorManager.brown2Color,
            ColorManager.brown2Color,
            ColorManager.brown2Color
          ],
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
    );
  }
}
