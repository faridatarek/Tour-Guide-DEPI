import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/home/data/models/place_model.dart';
import 'package:tour_guide/features/placeDetails/view/widgets/customRichTxt_widget.dart';
import 'package:tour_guide/features/placeDetails/view/widgets/saveButton_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/helper/spacing.dart';


class PlaceDetailsScreen extends StatelessWidget {
  final Place place;

  const PlaceDetailsScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkOrangeColor,
      body:
      Stack(
        children: [
          Column(
            children: [
              Stack(children: [
                Image.network
                  (place.images.isNotEmpty
                    ? place.images[0]
                    : 'https://www.advancedmd.com/wp-content/uploads/2021/06/advancedMD-lifestyle-computerError.png')
                ,Positioned(
                    bottom: 0,right: 0,
                    child: Container(height: 50.h,width: 200.w,child: Center(child: Text(place.name,style:TextStyles.font20whiteExtraBold
                      ,textDirection: TextDirection.rtl,)),
                      decoration: BoxDecoration(color: ColorManager.darkOrangeColor,borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12))),)),
                Positioned(
                  top: 40,right: 20,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Image.asset(ImagePaths.backArrow,height: 40.h,width: 40.w,),
                  ),
                )


              ],),
              Expanded(child:
              SingleChildScrollView(

                child: Container(width: MediaQuery.of(context).size.width, decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(15)))
                  ,child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomRichTextWidget(
                          title: "المحافظة",
                          value: place.governorate,
                        ),
                        SizedBox(height: 5.h,),
                        CustomRichTextWidget(
                          title: "المنطقة",
                          value: place.region,
                        ),
                        SizedBox(height: 5.h,),
                        CustomRichTextWidget(
                          title: "العنوان",
                          value: place.address,
                        ),
                        SizedBox(height: 5.h,),
                        CustomRichTextWidget(
                          title: "متاح للزيارة",
                          value: "نعم",
                        ),
                        SizedBox(height: 5.h,),
                        CustomRichTextWidget(
                          title: "مواعيد الزيارة",
                          value: place.visitingHours,
                        ),
                        SizedBox(height: 5.h,),
                        CustomRichTextWidget(
                          title: "سعر التذكرة",
                          value: place.ticketPrice,
                        ),
                        SizedBox(height: 5.h,),
                        CustomRichTextWidget(
                          title: "تفاصيل المكان",
                          value: place.description,
                        ),
                         SizedBox(height: 20.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("الموقع علي الخريطة", style:TextStyles.font18BrownBold,),
                            SizedBox(
                              width: 35.w,
                              height: 35.h,
                              child: Image.asset(ImagePaths.logoPath),
                            ),
                          ],
                        ),SizedBox(height: 12.h,),
                        InkWell(
                          onTap: (){
                            if (place.lat != null && place.lon != null) {
                              final String mapsUrl = "https://www.google.com/maps?q=${place.lat},${place.lon}";
                              launchUrl(Uri.parse(mapsUrl));
                            }
                          },
                          child: Center(
                            child: Container(
                              height: 200.h,width: 370.w,decoration: BoxDecoration(color: ColorManager.primaryColor,borderRadius: BorderRadius.circular(12.r)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(ImagePaths.elKarnaklocation),
                                  )   ,
                                  SizedBox(
                                      width: 120.w,
                                      height: 100.h,
                                      child: Image.asset(ImagePaths.location)),


                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("صور للمكان", style: TextStyles.font18BrownBold,),
                            SizedBox(
                              width: 35.w,
                              height: 35.h,
                              child: Image.asset(ImagePaths.logoPath),
                            ),
                          ],
                        ),SizedBox(height: 12.h,),
                        Container(
                          height: 230.h,
                          child: ListView.separated(
                            reverse: true,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) => horizontalSpace(10.w),
                            itemCount: place.images.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  place.images[index],
                                  fit: BoxFit.cover,
                                  width: 130,

                                ),
                              );
                            },
                          ),
                        )

                      ],
                    ),
                  ),),
              ))



            ],

          ),
          Positioned(
            bottom: 20,
            right: 40,
            left: 40,
            child:SavebuttonWidget(place:place ),
          )
        ],
      ),


    );
  }
}


