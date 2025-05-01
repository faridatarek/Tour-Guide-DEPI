import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';

class FamousPlaces extends StatelessWidget {
  FamousPlaces({super.key});

  final List<String> images = [
    'https://th.bing.com/th/id/OIP.JeSBN675i_Ah2lD8X2wcsQEoDS?rs=1&pid=ImgDetMain',
    'https://yallabook.com/blog/admincp/userfiles/%D8%AE%D8%A7%D9%86-%D8%A7%D9%84%D8%AE%D9%84%D9%8A%D9%84%D9%8A.jpg',
    'https://cdn.alweb.com/thumbs/egyptencyclopedia/article/fit710x532/%D8%A3%D9%87%D8%B1%D8%A7%D9%85%D8%A7%D8%AA-%D9%85%D8%B5%D8%B1-%D8%AA%D8%A7%D8%B1%D9%8A%D8%AE%D9%87%D8%A7-%D9%85%D9%85%D9%8A%D8%B2%D8%A7%D8%AA%D9%87%D8%A7-%D9%88%D8%A3%D9%83%D8%AB%D8%B1.jpg',
    'https://greyglobetrotters.com/wp-content/uploads/2019/03/Siwa-Salt-Lakes.jpg',
    'https://img.freepik.com/premium-photo/view-aswan_219717-6199.jpg',
  ];

  final List<String> labels = [
    'مكتبة الأسكندرية',
    'خان الخليلى',
    'أهرامات الجيزة',
    'واحة سيوة',
    'جزيرة الفنتين',

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
                  onTap: () {},
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
                          color: ColorManager.darkOrangeColor.withOpacity(0.5),
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
