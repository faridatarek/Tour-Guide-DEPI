import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';

class PlaceListViewScreen extends StatelessWidget {
  PlaceListViewScreen({super.key});

  final List<String> networkImagesUrl = const [
    'https://th.bing.com/th/id/R.3875c252f986a546da9fc82c0e33d26e?rik=yEhFTAiyjfzzeQ&pid=ImgRaw&r=0',
    'https://egyptiangeographic.com/uploads/files/egyptiangeographic.com_1605356917_1.jpg',
    'https://th.bing.com/th/id/R.b6da499dbdb8db4c99e0e3f085fc44dd?rik=2BF6UjFMrvh0UA&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/OIP.P--0-iz2JO90jEXmoIetpAHaE8?w=6016&h=4016&rs=1&pid=ImgDetMain',
    'https://i.pinimg.com/originals/c4/b0/e9/c4b0e964300240dd809b34bc358d9a29.jpg',
    'https://www.osiristours.com/wp-content/uploads/2016/11/valleyofqueens17.jpg',
    'https://images.memphistours.com/large/772270975_Luxor%20temple.jpg',
    'https://th.bing.com/th/id/OIP.RdjyfXTMnsZbm6WICzVSSAHaFj?rs=1&pid=ImgDetMain',
    'https://i.pinimg.com/736x/95/fb/92/95fb924144f069528f7882bdc7f9364d.jpg',
    'https://yallabook.com/guide/uploade/files/151013_920_4c8ef.jpg',
    'https://th.bing.com/th/id/R.89e58aee356381f08c58324b110c4490?rik=eb015hpl82bZDQ&riu=http%3a%2f%2fwww.wonderfultravels.nl%2fFotos%2fRegios%2fMidden_Oosten%2fLuxor%2fRamesseum%2f201119529.jpg&ehk=qYduqlJrXoDRQ5QIXo%2b9%2f7S9KMHqiFmLq5g6p6NkjDk%3d&risl=&pid=ImgRaw&r=0'
  ];

  final List<String> titles = const [
    'معبد الكرنك ',
    'مسجد أبي الحجاج ',
    'دير مارجرجس ',
    'مقابر النبلاء',
    'تمثالا ممنون ',
    'وادي الملوك ',
    'معبد الأقصر',
    'دير الشهداء (دير المدينة)',
    'معبد الملكة حتشبسوت',
    'معبد مدينة هابو ',
    'معبد الملك رمسيس ',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(12.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  bool isSelected = true;

                  return Container(
                    height: 200.h,
                    margin: EdgeInsets.only(bottom: 12.h),
                    decoration: BoxDecoration(
                      color: ColorManager.lightBeigeColor,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Image.network(
                            networkImagesUrl[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Positioned(
                          bottom: 7.h,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.h),
                            child: Text(
                              titles[index],
                              style: TextStyles.font22whiteExtraBold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 3.h,
                          left: 3.w,
                          child: IconButton(
                            onPressed: () {
                              isSelected != isSelected;
                            },
                            icon: SvgPicture.asset(
                              ImagePaths.favIconPath,
                              color: isSelected
                                  ? ColorManager.brown2Color
                                  : Colors.grey[300],
                              height: 50.h,
                              width: 50.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: networkImagesUrl.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
