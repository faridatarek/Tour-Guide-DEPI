import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';

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
          top: MediaQuery.of(context).padding.top + 20,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 24),
              Expanded(
                child: Center(
                  child: title != null
                      ? Text(
                          title!,
                          style: TextStyles.font20whiteExtraBold,
                          textAlign: TextAlign.center,
                        )
                      : SizedBox.shrink(),
                ),
              ),
              if (onBackPressed != null)
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    ImagePaths.backArrow,
                    height: 35.h,
                    width: 35.w,
                  ),
                )
              else
                const SizedBox(width: 24),
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
            decoration: const BoxDecoration(
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

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
