import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/utils/text_styles.dart';

class PromotedPlaces extends StatelessWidget {
  PromotedPlaces({super.key});

  final List<String> images = [
    'https://th.bing.com/th/id/R.3875c252f986a546da9fc82c0e33d26e?rik=yEhFTAiyjfzzeQ&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/R.3875c252f986a546da9fc82c0e33d26e?rik=yEhFTAiyjfzzeQ&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/R.3875c252f986a546da9fc82c0e33d26e?rik=yEhFTAiyjfzzeQ&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/R.3875c252f986a546da9fc82c0e33d26e?rik=yEhFTAiyjfzzeQ&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/R.3875c252f986a546da9fc82c0e33d26e?rik=yEhFTAiyjfzzeQ&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/R.3875c252f986a546da9fc82c0e33d26e?rik=yEhFTAiyjfzzeQ&pid=ImgRaw&r=0',
  ];

  final List<String> labels = [
    'الجيزة',
    'الإسكندرية',
    'الأقصر',
    'الأقصر',
    'الأقصر',
    'الأقصر',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                    onTap: () {},
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
      ),
    );
  }
}
