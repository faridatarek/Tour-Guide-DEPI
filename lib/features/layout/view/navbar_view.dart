import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/features/AllPLaces/view/places_screen.dart';



class NavbarView extends StatefulWidget {
  const NavbarView({super.key, this.index});
  final int? index;

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  int currentPageIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> screens = [
     AllPlacesScreen()
    //HomeScreen(),
    // WishVisitScreen(),
    // FavouriteScreen(),
    // ReminderNotificationScreen(),
    // MoreScreen(),
  ];

  final List<String> labels = const [
    'الرئيسية',
    'زياراتي',
    'المفضلة',
    'الاشعارات',
    'المزيد'
  ];

  final List<String> bottomNavIcons =  [
    ImagePaths.logoPath,
    'assets/icons/wish list.png',
    'assets/icons/saved.png',
    'assets/icons/notification.svg',
    'assets/icons/more.svg'
  ];

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      currentPageIndex = widget.index!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App?'),
            content: const Text('Do you want to exit the application?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        );
        return shouldExit ?? false;
      },
      child: Scaffold(
        backgroundColor: ColorManager.beigeColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorManager.primaryColor,

        ),
        body: IndexedStack(
          index: currentPageIndex,
          children: screens,
        ),
        bottomNavigationBar: _buildCurvedNavigationBar(),
      ),
    );
  }

  Widget _buildCurvedNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.r),
      child: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: currentPageIndex,
        height: 65.h,

        items: List.generate(
          bottomNavIcons.length,
          (index) => Container(
            //padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPageIndex == index
                  ? Colors.white12
                  : Colors.transparent,
            ),
            child: SizedBox(
              child: Image.asset(
                bottomNavIcons[index],
                width: currentPageIndex != index ? 40.w : 28.w,
                height: currentPageIndex != index ? 38.h : 22.h,
                color: currentPageIndex == index
                    ? Colors.white
                    : ColorManager.primaryColor,
              ),
            ),
          ),
        ),
        color: ColorManager.lightBeigeColor,
         buttonBackgroundColor: ColorManager.primaryColor,
        backgroundColor: ColorManager.lightBeigeColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
