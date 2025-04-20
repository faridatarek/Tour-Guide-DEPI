import 'package:flutter/material.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/features/notifications/view/notifications_screen.dart';
import 'package:tour_guide/features/places/view/places_screen.dart';
import 'bottom_nav_container.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const AllPlacesScreen(),
    const AllPlacesScreen(),
    const AllPlacesScreen(),
    // const VisitsScreen(),
    // const FavoritesScreen(),
    const NotificationsScreen(),
    const AllPlacesScreen(),
    // const MoreScreen(),
  ];

  final List<String> icons = [
    ImagePaths.homeIconPath,
    ImagePaths.savedIconPath,
    ImagePaths.favNavIconPath,
    ImagePaths.notificationIconPath,
    ImagePaths.moreIconPath,
  ];

  final List<String> labels = [
    'الرئيسية',
    'زياراتي',
    'المفضلة',
    'الاشعارات',
    'المزيد',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBeigeColor,
      appBar: AppBar(
        title: Text(
          labels[currentIndex],
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const SizedBox.shrink(),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CustomCurvedNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        icons: icons,
        labels: labels,
        activeColor: ColorManager.brown2Color,
        inactiveColor: Colors.grey[700]!,
      ),
    );
  }
}
