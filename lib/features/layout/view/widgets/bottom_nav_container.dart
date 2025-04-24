import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tour_guide/core/utils/color_manager.dart';

class CustomCurvedNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<String> icons;
  final List<String> labels;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;

  const CustomCurvedNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.icons,
    required this.labels,
    this.activeColor = ColorManager.brownColor,
    this.inactiveColor = Colors.grey,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -20,
            left: calculatePosition(context),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: activeColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: activeColor.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  icons[currentIndex],
                  width: 44,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Navigation items
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                icons.length,
                (index) => buildNavItem(
                  icon: icons[index],
                  label: labels[index],
                  isActive: index == currentIndex,
                  index: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavItem({
    required String icon,
    required String label,
    required bool isActive,
    required int index,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              color: isActive ? Colors.transparent : inactiveColor,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isActive ? Colors.transparent : inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculatePosition(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / icons.length;
    return (itemWidth * currentIndex) + (itemWidth / 2) - 30;
  }
}
