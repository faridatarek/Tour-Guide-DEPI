import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/places/view/widgets/place_list_view_screen.dart';

class AllPlacesScreen extends StatelessWidget {
  const AllPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: ListTile(
            leading: SizedBox(
              width: 40.w,
              height: 50.h,
              child: Image.asset(ImagePaths.logoPath),
            ),
            title: Text(
              "الأقصر  ",
              style: TextStyles.font18Brown2ExtraBold,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_alt_sharp,
                size: 44.sp,
                color: ColorManager.primaryColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        Expanded(child: PlaceListViewScreen()),
      ],
    );
  }
}
