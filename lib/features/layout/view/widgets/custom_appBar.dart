import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';

/*class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return    Stack(children: [
      Container(width: MediaQuery.of(context).size.width,height: 140.h,
      child: Image.asset(ImagePaths.appBar_bg,fit: BoxFit.cover,),
      )
      ,Positioned(
          bottom: 0,right: 30,left: 30,
          child: Container(height: 15.h,width: 200.w,
            decoration: BoxDecoration(color: ColorManager.darkOrangeColor,borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12))),)),

    ],);

  }
}*/


class CustomAppbar extends StatelessWidget {
  final String? title;
  final VoidCallback? onBackPressed;

  const CustomAppbar({super.key, this.title, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 140.h,
          child: Image.asset(
            ImagePaths.appBar_bg,
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          top: MediaQuery.of(context).padding.top + 35,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 24),

              Expanded(
                child: Center(
                  child: title != null
                      ? Text(
                    title!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                      : SizedBox.shrink(),
                ),
              ),


              if (onBackPressed != null)
                GestureDetector(
                  onTap: onBackPressed,
                  child: Image.asset(ImagePaths.backArrow,height: 40.h,width: 40.w,),
                )
              else
                SizedBox(width: 24),
            ],
          ),
        ),

        Positioned(
          bottom: 0,
          right: 30,
          left: 30,
          child: Container(
            height: 15.h,
            width: 200.w,
            decoration: BoxDecoration(
              color: ColorManager.darkOrangeColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
