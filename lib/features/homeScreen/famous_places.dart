import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';

class FamousPlaces extends StatelessWidget {
  FamousPlaces({super.key});

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
    'دير كاترين',
    ' قلعة قايتباى قلعة قايتباى',
    'البحر الاحمر',
    'مرسى مطروح',
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
                          color: ColorManager.brownColor.withAlpha(180),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            maxLines: 2,
                            // handle text overflow with max number of lines
                            overflow: TextOverflow.ellipsis,
                            labels[index],
                            style: TextStyles.font14whiteExtraBold,
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
