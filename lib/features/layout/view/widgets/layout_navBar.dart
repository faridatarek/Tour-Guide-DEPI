import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/home/view/home_screen.dart';
import 'package:tour_guide/features/notifications/view/notifications_screen.dart';
import 'package:tour_guide/features/saved/view/saved_screen.dart';
import 'package:tour_guide/features/settings/view/settings_screen.dart';

class LayoutNavBar extends StatefulWidget {
  const LayoutNavBar({super.key});

  @override
  State<LayoutNavBar> createState() => _LayoutNavBarState();
}

class _LayoutNavBarState extends State<LayoutNavBar> {
  List<Widget> PagesName = [

    const SettingsScreen(),
    const NotificationsScreen() ,
    const  VisitsScreen(),
    const HomeScreen(),
  ];
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:

        CircleNavBar(

          iconCurve: Curves.bounceInOut,


          activeIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          activeIcons: [
            Icon(Icons.settings ,color: ColorManager.primaryColor,size:35),         // index 3
            Icon(Icons.notifications ,color: ColorManager.primaryColor,size: 35),   // index 2
            Icon(Icons.bookmark_added,color: ColorManager.primaryColor,size: 35 ),  // index 1
            Center(child: Image.asset(ImagePaths.logoPath,width: 70.w,height: 50.h)), // index 0
          ],
          inactiveIcons:  [
            Padding(
              padding:  EdgeInsets.only(left:10.w,right: 6.w,top: 5.h),
              child: Column(
                children: [
                  Icon(Icons.settings,color:ColorManager.brownColor,size: 30),
                  Text("الاعدادات",style:TextStyles.font14BrownBold.copyWith(fontSize: 20.sp)),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left:10.w,right: 6.w,top: 5.h),
              child: Column(
                children: [
                  Icon(Icons.notifications ,color: ColorManager.brownColor,size: 30),
                  Text("الاشعارات",style: TextStyles.font14BrownBold.copyWith(fontSize: 20.sp)),
                ],
              ),
            ),
            Padding( padding:  EdgeInsets.only(left:10.w,right: 6.w,top: 5.h),
              child: Column(
                children: [
                  Icon(Icons.bookmark_added,color: ColorManager.brownColor,size: 30 ),
                  Text("زياراتي",style: TextStyles.font14BrownBold.copyWith(fontSize: 20.sp)),

                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left:10.w,right: 6.w,top: 5.h),
              child: Column(

                children: [

                  Center(child: Image.asset(ImagePaths.logoPath,width: 55.w,height: 35.h)),
                  Text("الرئيسية",style:TextStyles.font14BrownBold.copyWith(fontSize: 20.sp)),
                ],
              ),
            ),


          ],

          color: Colors.red,
          circleColor: Colors.red,
          height: 75,
          circleWidth: 60,

          // tabCurve: ,
          padding:  EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20),
          cornerRadius: const BorderRadius.only(
            topLeft: Radius.circular(2),
            topRight: Radius.circular(2),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),

          circleShadowColor: ColorManager.primaryColor,


          elevation: 10,
          gradient: LinearGradient(

            colors: [

              ColorManager.beigeColor.withOpacity(0.5),
              ColorManager.primaryColor.withOpacity(0.5),

            ],
          ),
          circleGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorManager.primaryColor,
              ColorManager.primaryColor,
              ColorManager.brown2Color,
              ColorManager.brown2Color,
              ColorManager.brown2Color],
          ),
        ),
        body: Center(child: PagesName[currentIndex])
    );
  }
}

