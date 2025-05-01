import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'package:intl/intl.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/home/data/models/place_model.dart';
import 'package:tour_guide/features/placeDetails/view/widgets/customRichTxt_widget.dart';
import 'package:tour_guide/features/placeDetails/view/widgets/saveButton_widget.dart';
import 'package:tour_guide/features/saved/data/models/favourite_model.dart';
import 'package:tour_guide/features/saved/data/models/visit_model.dart';
import '../../../core/helper/spacing.dart';

class PlaceDetailsScreen extends StatefulWidget {
  final Place place;

  const PlaceDetailsScreen({super.key, required this.place});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
// أضف هذه الدوال لإدارة المفضلة والزيارات
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
    } else {
      await favoritesBox.add(favorite);
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
      setState(() {});
    }
  }

  Widget _buildVisitButton() {
    final visitsBox = Hive.box<VisitModel>('visits');
    final hasVisit = visitsBox.values.any((v) => v.name == widget.place.name);

    return GestureDetector(
      onTap: _scheduleVisit,
      child: Container(
        // تصميم الزر
        child: Text(hasVisit ? 'تم جدولتها' : 'زيارة لاحقة'),
      ),
    );
  }

  Widget _buildFavoriteButton() {
    final favoritesBox = Hive.box<FavouriteModel>('favorites');
    final isFavorite =
        favoritesBox.values.any((f) => f.name == widget.place.name);

    return GestureDetector(
      onTap: _toggleFavorite,
      child: Container(
        // تصميم الزر
        child: Text(isFavorite ? 'إزالة من المفضلة' : 'إضافة إلى المفضلة'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkOrangeColor,
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.network(widget.place.images.isNotEmpty
                      ? widget.place.images[0]
                      : 'https://www.advancedmd.com/wp-content/uploads/2021/06/advancedMD-lifestyle-computerError.png'),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 50.h,
                        width: 200.w,
                        child: Center(
                            child: Text(
                          widget.place.name,
                          style: TextStyles.font20whiteExtraBold,
                          //textDirection: TextDirection.rtl,
                        )),
                        decoration: BoxDecoration(
                            color: ColorManager.darkOrangeColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12))),
                      )),
                  Positioned(
                    top: 40,
                    right: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        ImagePaths.backArrow,
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomRichTextWidget(
                          title: "المحافظة",
                          value: widget.place.governorate,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomRichTextWidget(
                          title: "المنطقة",
                          value: widget.place.region,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomRichTextWidget(
                          title: "العنوان",
                          value: widget.place.address,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomRichTextWidget(
                          title: "متاح للزيارة",
                          value: "نعم",
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomRichTextWidget(
                          title: "مواعيد الزيارة",
                          value: widget.place.visitingHours,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomRichTextWidget(
                          title: "سعر التذكرة",
                          value: widget.place.ticketPrice,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomRichTextWidget(
                          title: "تفاصيل المكان",
                          value: widget.place.description,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "الموقع علي الخريطة",
                              style: TextStyles.font18BrownBold,
                            ),
                            SizedBox(
                              width: 35.w,
                              height: 35.h,
                              child: Image.asset(ImagePaths.logoPath),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Center(
                          child: Container(
                            height: 200.h,
                            width: 370.w,
                            decoration: BoxDecoration(
                                color: ColorManager.primaryColor,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.asset(ImagePaths.elKarnaklocation),
                                ),
                                SizedBox(
                                    width: 120.w,
                                    height: 100.h,
                                    child: Image.asset(ImagePaths.location)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "صور للمكان",
                              style: TextStyles.font18BrownBold,
                            ),
                            SizedBox(
                              width: 35.w,
                              height: 35.h,
                              child: Image.asset(ImagePaths.logoPath),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Container(
                          height: 230.h,
                          child: ListView.separated(
                            reverse: true,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                horizontalSpace(10.w),
                            itemCount: widget.place.images.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  widget.place.images[index],
                                  fit: BoxFit.cover,
                                  width: 130,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
          Positioned(
            bottom: 20,
            left: 40,
            right: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildVisitButton(),
                _buildFavoriteButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
