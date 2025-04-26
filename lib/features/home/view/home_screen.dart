import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/features/home/view/widgets/auto_scrolling.dart';
import 'package:tour_guide/features/home/view/widgets/famous_places.dart';
import 'package:tour_guide/features/home/view/widgets/nearst_places.dart';
import 'package:tour_guide/features/home/view/widgets/promote_places.dart';
import 'package:tour_guide/features/home/view/widgets/titles.dart';
import 'package:tour_guide/features/places/view/places_screen.dart';


import '../../../core/utils/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SliderWidget(),
              SizedBox(height: 15.h),
              Titles(title: 'ماذا حولك؟؟'),
              SizedBox(height: 15.h),
              NearestPlaces(),
              SizedBox(height: 15.h),
              Row(

                children: [
                  Titles(title: 'أشهر المحافظات السياحية'),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "عرض الكل",
                        style: TextStyles.font14DarkOrangeBold.copyWith( decoration: TextDecoration.underline,decorationColor: ColorManager.darkOrangeColor),

                      )),
                ],
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 120.h,
                child: PromotedPlaces(),
              ),
              SizedBox(height: 15.h),
              Titles(title: 'أكثر المعالم ترويجًا'),
              SizedBox(height: 15.h),
              FamousPlaces(),
            ],
          ),
        ),
      ),
    ));
  }
}
