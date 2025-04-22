import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/font_weight_helper.dart';

class TextStyles {
  static TextStyle font18Brown2ExtraBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: ColorManager.brown2Color,
  );
  static TextStyle font18LightBrown2ExtraBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: ColorManager.brownColor,
  );
  static TextStyle font14DarkOrangeBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.darkOrangeColor,
    fontFamily: 'Cairo',
  );
  static TextStyle font22whiteExtraBold = TextStyle(
      color: Colors.white,
      fontSize: 22.sp,
      fontWeight: FontWeightHelper.extraBold,
      fontFamily: 'Cairo');

  static TextStyle font14DarkOrangeMedium = TextStyle(
      color: ColorManager.darkOrangeColor,
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium,
      fontFamily: 'Cairo');

  static TextStyle font14BrownMedium = TextStyle(
    color: ColorManager.brownColor,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: 'Cairo',
  );
  static TextStyle font14BrownBold = TextStyle(
    color: ColorManager.brownColor,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: 'Cairo',
  );
  static TextStyle font16BrownBold = TextStyle(
    color: ColorManager.brownColor,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: 'Cairo',
  );
//subtitle text style
  static TextStyle font10greyMedium = TextStyle(
    color: Colors.grey[700],
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: 'Cairo',
  );
}
