import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/places/view/places_screen.dart';

class PromotedPlaces extends StatelessWidget {
  PromotedPlaces({super.key});

  final List<String> images = [
    'https://advice.aqarmap.com.eg/ar/wp-content/uploads/2020/03/%D8%AE%D8%AF%D9%85%D8%A7%D8%AA-%D9%85%D8%AD%D8%A7%D9%81%D8%B8%D8%A9-%D8%A7%D9%84%D8%AC%D9%8A%D8%B2%D8%A9-%D8%AC%D8%A7%D9%85%D8%B9%D8%A9-%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9.jpg',
    'https://th.bing.com/th/id/OIP.8gMTnom1wKDynU5CDWsfogHaDt?rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/OIP.KEwTD5ikQicDm_r7Yb9lYgHaEK?rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/R.f9f038fe6570645211ec3ac0fdf6180e?rik=XxQC74OHSXbFvA&riu=http%3a%2f%2fwww.dakahliya.gov.eg%2fNew_Gov_Pics%2fNew_Pics%2fdakhlya_pics%2fnile1.jpg&ehk=M48Z6jjbVQCazDvTpanuRsD2FXQ6Zkv2e74XQI%2fRcyQ%3d&risl=&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/R.5015c78015d2dfe98cdcb39736b2b0a5?rik=ko03gnMaZ52rXQ&pid=ImgRaw&r=0',
  ];

  final List<String> labels = [
    'الجيزة',
    'الإسكندرية',
    'الأقصر',
    'الدقهلية',
    'سيناء',
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
            height: 110,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const AllPlacesScreen()));

                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          images[index],
                          height: 110.h,
                          width: 220.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 110.h,
                        width: 220.w,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            labels[index],
                            style: TextStyles.font22whiteExtraBold,
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
