import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/layout/view/widgets/custom_appBar.dart';
import 'package:tour_guide/features/places/view/widgets/place_list_view_screen.dart';


/*class AllPlacesScreen extends StatelessWidget {
  const AllPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: CustomAppbar(title: "الأقصر",onBackPressed: (){},)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                leading: SizedBox(
                  width: 40.w,
                  height: 50.h,
                  child: Image.asset(ImagePaths.logoPath),
                ),
                title: Text(
                  "الأقصر",
                  style: TextStyles.font18Brown2ExtraBold.copyWith(fontSize: 30),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_alt_sharp,
                    size: 40.sp,
                    color: ColorManager.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          PlaceListViewScreen(),
        ],
      ),
    );
  }
}*/



class AllPlacesScreen extends StatelessWidget {
  final String governorate;

  const AllPlacesScreen({super.key, required this.governorate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: CustomAppbar(
          title: governorate,
          onBackPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                leading: SizedBox(
                  width: 40.w,
                  height: 50.h,
                  child: Image.asset(ImagePaths.logoPath),
                ),
                title: Text(
                  governorate,
                  style: TextStyles.font18Brown2ExtraBold.copyWith(fontSize: 30),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_alt_sharp,
                    size: 40.sp,
                    color: ColorManager.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: PlaceListViewScreen(governorate: governorate),
          ),
        ],
      ),
    );
  }
}
