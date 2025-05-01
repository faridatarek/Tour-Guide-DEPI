import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import '../../../../core/utils/color_manager.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: TextFormField(
          onChanged: (value) {},
          decoration: InputDecoration(
            hintText: 'ابحث هنا...',
            hintStyle: TextStyles.font14BrownBold.copyWith(fontSize: 20.sp),
            prefixIcon: const Icon(
              Icons.search,
              color: ColorManager.brownColor,
            ),
            filled: true,
            fillColor: Colors.white.withAlpha(200),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
