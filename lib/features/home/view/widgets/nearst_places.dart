import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/placeDetails/view/placeDetails_screen.dart';

class NearestPlaces extends StatelessWidget {
  NearestPlaces({super.key});

  final List<String> images = [
    'https://www.sfari.com/wp-content/uploads/2023/04/%D8%A7%D9%81%D8%B6%D9%84-%D8%A7%D9%86%D8%B4%D8%B7%D8%A9-%D8%B9%D9%86%D8%AF-%D8%B2%D9%8A%D8%A7%D8%B1%D8%A9-%D9%85%D8%B9%D8%A8%D8%AF-%D8%A7%D9%84%D8%A7%D9%82%D8%B5%D8%B1-1.jpg',
    'https://www.ootlah.com/wp-content/uploads/2020/06/luxor.jpg',
    'https://egyptiangeographic.com/uploads/files/egyptiangeographic.com_1605356917_1.jpg',
    'https://i.pinimg.com/originals/c4/b0/e9/c4b0e964300240dd809b34bc358d9a29.jpg',
    'https://www.osiristours.com/wp-content/uploads/2016/11/valleyofqueens17.jpg',
  ];

  final List<String> labels = [
    'معبد لأقصر',
    'معبد الكرنك',
    'ابي حجاج',
    'تمثالا ممنون',
    'وادي الملوك',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 10.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 220.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlaceDetailsScreen(
                                  name: labels[index],
                                  image: images[index],
                                  governorate: 'الأقصر',
                                  area: 'الكرنك',
                                  address: 'الكرنك',
                                  visitingHours: '9:00 AM - 5:00 PM',
                                  ticketPrice: '100 EGP',
                                  description:
                                      'معبد الكرنك هو معبد ضخم يقع في مدينة الأقصر بمصر. يُعتبر واحدًا من أكبر المعابد في العالم، ويعود تاريخه إلى العصور الفرعونية. يتميز بتصميمه المعماري الرائع وزخارفه الجميلة، ويحتوي على مجموعة متنوعة من المعابد والأعمدة والنقوش التي تعكس تاريخ وثقافة مصر القديمة.',
                                )));
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          images[index],
                          height: 220.h,
                          width: 125.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 100.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: ColorManager.brownColor.withAlpha(180),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              labels[index],
                              style: TextStyles.font14whiteExtraBold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
