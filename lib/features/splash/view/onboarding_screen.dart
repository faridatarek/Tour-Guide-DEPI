import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/features/layout/view/widgets/layout_navBar.dart';

class OnboardingScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final PageController controller;
  final int index;

  const OnboardingScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
          ),
          SizedBox(height: 20.h,),
          SizedBox(
              height: 110.h,
              width: 300.w,
              child: Image.asset('assets/icons/kem_logo.png',fit: BoxFit.fill,

              )),

          SizedBox(height: 35.h,),
          Text(
            title,
            style:  TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold,color: ColorManager.brownColor),
            textAlign: TextAlign.center,
          ),
           SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              description,
              style:  TextStyle(fontSize: 25.sp,color: ColorManager.brownColor),
              textAlign: TextAlign.center,
            ),
          ),
      SizedBox(height: 55.h,),
          InkWell(
              onTap: () {
                if (index == 1) {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => LayoutNavBar(),)); // أو استخدم Navigator.push حسب ما تحب
                } else {
                  controller.animateToPage(
                    index + 1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom:30),
                child: Image.asset("assets/icons/button.png",height: 135.h,width: 135.w,),
              ))
        ],
      ),
    );
  }
}

class GuidePager extends StatelessWidget {
  final PageController _pageController = PageController();
  final List<Map<String, String>> pages = [
    {
      'image': 'assets/icons/onboarding1.png',
      'title': 'تمتع بوقتك...',
      'description': 'قم بزيارة جميع المعالم السياحية التي ترغب بها بسهولة',
    },
    {
      'image': 'assets/icons/onboarding2.png',
      'title': 'وفر جهدك ...',
      'description': 'مع دليل سياحي شامل يُطلعك على كل ما تحتاج معرفته',
    },
  ];

  GuidePager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return OnboardingScreen(
            imagePath: pages[index]['image']!,
            title: pages[index]['title']!,
            description: pages[index]['description']!,
            controller: _pageController,
            index: index,
          );
        },
      ),
    );
  }
}



