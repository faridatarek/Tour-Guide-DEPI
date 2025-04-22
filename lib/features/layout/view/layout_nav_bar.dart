import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/core/widgets/custom_app_bar.dart';
import 'package:tour_guide/features/notifications/view/notifications_screen.dart';
import 'package:tour_guide/features/places/view/places_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  final List<Widget> screens = [
    const AllPlacesScreen(),
    const AllPlacesScreen(),
    const NotificationsScreen(),
    const AllPlacesScreen(),
  ];

  final List<String> icons = [
    ImagePaths.logoKemit,
    ImagePaths.savedIconPath,
    ImagePaths.notificationsIconPath,
    ImagePaths.settingsIconPath,
  ];

  final List<String> labels = [
    'الرئيسية',
    'زياراتي',
    'الاشعارات',
    'الاعدادات',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.beigeColor,
      appBar: CustomAppBar(
        title: labels[currentIndex],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: bottomNavigationKey,
        index: currentIndex,
        items: List.generate(icons.length, (index) {
          final isActive = currentIndex == index;

          return isActive
              ? Container(
                  decoration: const BoxDecoration(
                    color: ColorManager.brown2Color,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(8.w),
                  child: Image.asset(
                    icons[index],
                    width: 65.w,
                    height: 65.h,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      icons[index],
                      width: 29.w,
                      height: 28.h,
                      color: ColorManager.brownColor,
                    ),
                    Text(labels[index], style: TextStyles.font16BrownBold),
                  ],
                );
        }),
        height: 70.h,
        backgroundColor: ColorManager.beigeColor,
        color: ColorManager.primaryColor,
        buttonBackgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOutCubicEmphasized,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
