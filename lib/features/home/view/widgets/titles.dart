import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/text_styles.dart';

class Titles extends StatelessWidget {
  const Titles({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          ImagePaths.logoPath,
          width: 35.w,
          height: 35.h,
        ),
        Text(title, style: TextStyles.font25Brown2ExtraBold),
      ],
    );
  }
}
