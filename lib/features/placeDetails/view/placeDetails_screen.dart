import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/font_weight_helper.dart';
import 'package:tour_guide/core/utils/text_styles.dart';

import '../../../core/helper/spacing.dart';

class PlaceDetailsScreen extends StatefulWidget {
  const PlaceDetailsScreen({super.key});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  final List<String> placeImages = const [
    "https://th.bing.com/th/id/OIP.NTPpHvrbMdUAlZ5YI0U9SwHaE7?rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/OIP._QbqkOOYXuCE_stCCqCq5QHaEy?w=257&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.zxjwoAWqQh-G-WAnjqJKzQHaFh?pid=ImgDet&w=474&h=353&rs=1",
    "https://archaeologicalpaths.com/web/images/uploaded/shutterstock_556156237.jpg",
    "https://th.bing.com/th/id/OIP.jGXGgIkz9MfkaCjJymHyWgHaE8?rs=1&pid=ImgDetMain",
  ];
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
              content: Text(
                " تم تحديد زيارة المكان في تاريخ: ${pickedDate.toLocal().toString().split(' ')[0]}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  fontFamily: 'ArbFonts',
                ),
              ),
            ),
          );
        }
      } else {
        setState(() {
          selectedDate = null;
        });
      }
    }
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
                  Image.network(
                      "https://www.depthworld.com/wp-content/uploads/2019/10/karnak-temple.jpg"),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 50.h,
                        width: 200.w,
                        child: Center(
                            child: Text(
                          "معبد الكرنك",
                          style: TextStyles.font22whiteExtraBold,
                          textDirection: TextDirection.rtl,
                        )),
                        decoration: BoxDecoration(
                            color: ColorManager.darkOrangeColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12))),
                      )),
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
                        RichText(
                          text: TextSpan(
                            text: 'المحافظة: ',
                            style: TextStyle(
                              color: ColorManager.brownColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'ArbFonts',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'محافظة الأقصر',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: ColorManager.brownColor,
                                  fontFamily: 'ArbFonts',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'المنطقة: ',
                            style: TextStyle(
                                color: ColorManager.brownColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'الأقصر',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: ColorManager.brownColor,
                                  fontFamily: 'ArbFonts',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        RichText(
                          textDirection: TextDirection.rtl,
                          text: TextSpan(
                            text: 'العنوان: ',
                            style: TextStyle(
                              color: ColorManager.brownColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'ArbFonts',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'يقع معبد الكرنك في غربي "طيبة" الي الشمال من معبد الأقصر بنحو ثلاث كيلو مترات',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: ColorManager.brownColor,
                                  fontFamily: 'ArbFonts',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'متاح للزيارة: ',
                            style: TextStyle(
                              color: ColorManager.brownColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'ArbFonts',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'نعم',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: ColorManager.brownColor,
                                  fontFamily: 'ArbFonts',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'مواعيد الزيارة: ',
                            style: TextStyle(
                                color: ColorManager.brownColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800),
                            children: <TextSpan>[
                              TextSpan(
                                text: '7 صباحا - 8 مساءا',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: ColorManager.brownColor,
                                  fontFamily: 'ArbFonts',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'سعر التذكرة: ',
                            style: TextStyle(
                                color: ColorManager.brownColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'مصري (30 جنية) - اجنبي (300 جنية)',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: ColorManager.brownColor,
                                  fontFamily: 'ArbFonts',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        RichText(
                          textDirection: TextDirection.rtl,
                          text: TextSpan(
                            text: 'تفاصيل المكان:\n ',
                            style: TextStyle(
                              color: ColorManager.brownColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'ArbFonts',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'معبد الكرنك يُعد من أعظم المعابد في تاريخ مصر القديمة، وهو أكبر مجمع ديني قديم عرفه العالم، بُني على مدار أكثر من 2000 سنة بمشاركة ملوك الفراعنة المتعاقبين، ويُعتبر مركزًا رئيسيًا لعبادة الإله آمون رع وزوجته موت وابنهما خونسو، وهم "يشكلون ثالوث طيبة المقدس"  ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: ColorManager.brownColor,
                                  fontFamily: 'ArbFonts',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("الموقع علي الخريطة",
                                style: TextStyles.font22Brown2ExtraBold),
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
                            Text("صور للمكان",
                                style: TextStyles.font22Brown2ExtraBold),
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
                            itemCount: placeImages.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  placeImages[index],
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
            right: 40,
            left: 40,
            child: Container(
              height: 70.h,
              decoration: BoxDecoration(
                color: ColorManager.darkOrangeColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.r),
                    bottomLeft: Radius.circular(25.r)),
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
            ),
          )
        ],
      ),
    );
  }
}
