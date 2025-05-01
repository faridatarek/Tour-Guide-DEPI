import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/font_weight_helper.dart';
import 'package:tour_guide/features/home/data/models/place_model.dart';
import 'package:tour_guide/features/saved/data/models/favourite_model.dart';
import 'package:tour_guide/features/saved/data/models/visit_model.dart';

/*class SavebuttonWidget extends StatefulWidget {
  const SavebuttonWidget({super.key});

  @override

  State<SavebuttonWidget> createState() => _SavebuttonWidgetState();
}

class _SavebuttonWidgetState extends State<SavebuttonWidget> {
  String? selectedTab;
  DateTime? selectedDate;
  void toggleTab(String tabName) async {
    if (selectedTab == tabName) {
      setState(() {
        selectedTab = null;
        selectedDate = null;
      });
    } else {
      setState(() {
        selectedTab = tabName;
      });

      if (tabName == "زياراتي") {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        );

        if (pickedDate != null) {
          setState(() {
            selectedDate = pickedDate;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorManager.brown2Color,
              content: Text(" تم تحديد زيارة المكان في تاريخ: ${pickedDate.toLocal().toString().split(' ')[0]}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.sp),),
            ),
          );
        }
      } else {
        setState(() {
          selectedDate = null;
        });
      }}}
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: ColorManager.darkOrangeColor,
        borderRadius: BorderRadius.only(topRight: Radius.circular(25.r),bottomLeft:  Radius.circular(25.r) ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => toggleTab("زياراتي"),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedTab == "زياراتي"
                      ? ColorManager.darkOrangeColor
                      : ColorManager.lightBeigeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50.h,
                width: 155.w,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "زياراتي",
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeightHelper.bold,
                          fontFamily: 'ArbFonts',
                          color: selectedTab == "زياراتي"
                              ? ColorManager.lightBeigeColor
                              : ColorManager.darkOrangeColor,

                        ),
                      ),
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.bookmark,
                        color: selectedTab == "زياراتي"
                            ? ColorManager.lightBeigeColor
                            : ColorManager.brown2Color,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => toggleTab("مفضلة"),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedTab == "مفضلة"
                      ? ColorManager.darkOrangeColor
                      : ColorManager.lightBeigeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 55.h,
                width: 155.w,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(

                        "مفضلة",
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeightHelper.bold,
                          fontFamily: 'ArbFonts',
                          color: selectedTab == "مفضلة"
                              ? ColorManager.lightBeigeColor
                              : ColorManager.darkOrangeColor,

                        ),
                      ),
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.favorite,
                        color: selectedTab == "مفضلة"
                            ? ColorManager.lightBeigeColor
                            : ColorManager.brown2Color,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/


class SavebuttonWidget extends StatefulWidget {
  final Place place;

  const SavebuttonWidget({super.key, required this.place});

  @override
  State<SavebuttonWidget> createState() => _SavebuttonWidgetState();
}

class _SavebuttonWidgetState extends State<SavebuttonWidget> {
  String? selectedTab;
  DateTime? selectedDate;

  void toggleTab(String tabName) async {
    if (selectedTab == tabName) {
      setState(() {
        selectedTab = null;
        selectedDate = null;
      });
    } else {
      setState(() {
        selectedTab = tabName;
      });

      if (tabName == "زياراتي") {
        await _scheduleVisit();
      } else if (tabName == "مفضلة") {
        await _toggleFavorite();
      }
    }
  }

  Future<void> _toggleFavorite() async {
    final favoritesBox = Hive.box<FavouriteModel>('favorites');
    final favorite = FavouriteModel(
      name: widget.place.name,
      image: widget.place.images.isNotEmpty ? widget.place.images[0] : '',
      governorate: widget.place.governorate,
      area: widget.place.region,
      address: widget.place.address,
      visitingHours: widget.place.visitingHours,
      ticketPrice: widget.place.ticketPrice,
      description: widget.place.description,
    );

    if (favoritesBox.values.any((f) => f.name == widget.place.name)) {
      final index = favoritesBox.values
          .toList()
          .indexWhere((f) => f.name == widget.place.name);
      await favoritesBox.deleteAt(index);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorManager.brown2Color,
          content: Text("تمت إزالة المكان من المفضلة"),
        ),
      );
    } else {
      await favoritesBox.add(favorite);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorManager.brown2Color,
          content: Text("تمت إضافة المكان إلى المفضلة"),
        ),
      );
    }

    setState(() {});
  }

  Future<void> _scheduleVisit() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      final visitsBox = Hive.box<VisitModel>('visits');
      final visit = VisitModel(
        name: widget.place.name,
        image: widget.place.images.isNotEmpty ? widget.place.images[0] : '',
        visitDate: pickedDate,
        governorate: widget.place.governorate,
        area: widget.place.region,
        address: widget.place.address,
        visitingHours: widget.place.visitingHours,
        ticketPrice: widget.place.ticketPrice,
        description: widget.place.description,
      );

      await visitsBox.add(visit);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorManager.brown2Color,
          content: Text("تم تحديد زيارة المكان في تاريخ: ${pickedDate.toLocal().toString().split(' ')[0]}"),
        ),
      );

      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: ColorManager.darkOrangeColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.r),
          bottomLeft: Radius.circular(25.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // زر زياراتي
            GestureDetector(
              onTap: () => toggleTab("زياراتي"),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedTab == "زياراتي"
                      ? ColorManager.darkOrangeColor
                      : ColorManager.lightBeigeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50.h,
                width: 155.w,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "زياراتي",
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeightHelper.bold,
                          fontFamily: 'ArbFonts',
                          color: selectedTab == "زياراتي"
                              ? ColorManager.lightBeigeColor
                              : ColorManager.darkOrangeColor,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.bookmark,
                        color: selectedTab == "زياراتي"
                            ? ColorManager.lightBeigeColor
                            : ColorManager.brown2Color,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // زر المفضلة
            GestureDetector(
              onTap: () => toggleTab("مفضلة"),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedTab == "مفضلة"
                      ? ColorManager.darkOrangeColor
                      : ColorManager.lightBeigeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 55.h,
                width: 155.w,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "مفضلة",
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeightHelper.bold,
                          fontFamily: 'ArbFonts',
                          color: selectedTab == "مفضلة"
                              ? ColorManager.lightBeigeColor
                              : ColorManager.darkOrangeColor,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.favorite,
                        color: selectedTab == "مفضلة"
                            ? ColorManager.lightBeigeColor
                            : ColorManager.brown2Color,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
