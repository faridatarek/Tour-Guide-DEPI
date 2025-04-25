import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/features/layout/view/widgets/custom_appBar.dart';
import 'package:tour_guide/features/placeDetails/view/placeDetails_screen.dart';
import 'package:tour_guide/features/places/view/places_screen.dart';



class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  List<Widget> PagesName = [
    const AllPlacesScreen(),
    const AllPlacesScreen() ,
    const AllPlacesScreen() ,
    const  AllPlacesScreen(),
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
              padding:  EdgeInsets.only(left:10.w,right: 6.w,top: 19.h),
              child: Column(
                children: [
                  Icon(Icons.settings,color:ColorManager.brownColor,size: 30),
                  Text("الاعدادات",style: TextStyle(color:ColorManager.brownColor,fontSize: 13.sp,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left:10.w,right: 6.w,top: 16.h),
              child: Column(
                children: [
                  Icon(Icons.notifications ,color: ColorManager.brownColor,size: 30),
                  Text("الاشعارات",style: TextStyle(color:ColorManager.brownColor,fontSize: 13.sp,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding( padding:  EdgeInsets.only(left:10.w,right: 6.w,top: 18.h),
              child: Column(
                children: [
                  Icon(Icons.bookmark_added,color: ColorManager.brownColor,size: 30 ),
                  Text("زياراتي",style: TextStyle(color:ColorManager.brownColor,fontSize: 13.sp,fontWeight: FontWeight.bold)),

                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left:10.w,right: 6.w,top: 15.h),
              child: Column(

                children: [

                  Center(child: Image.asset(ImagePaths.logoPath,width: 55.w,height: 40.h)),
                  Text("الرئيسية",style: TextStyle(color:ColorManager.brownColor,fontSize: 13.sp,fontWeight: FontWeight.bold)),
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
          shadowColor:  Colors.grey.shade400,

          elevation: 10,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [

              Colors.white,
              Colors.white70,

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

