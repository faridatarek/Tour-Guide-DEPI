import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/helper/spacing.dart';
import 'package:tour_guide/core/utils/color_manager.dart';

class PlaceListViewScreen extends StatelessWidget {
  PlaceListViewScreen({super.key});
  final List<String> networkImagesUrl = const [
    'https://th.bing.com/th/id/R.3875c252f986a546da9fc82c0e33d26e?rik=yEhFTAiyjfzzeQ&pid=ImgRaw&r=0',
    'https://egyptiangeographic.com/uploads/files/egyptiangeographic.com_1605356917_1.jpg',
    'https://th.bing.com/th/id/R.b6da499dbdb8db4c99e0e3f085fc44dd?rik=2BF6UjFMrvh0UA&pid=ImgRaw&r=0'
        'https://th.bing.com/th/id/OIP.P--0-iz2JO90jEXmoIetpAHaE8?w=6016&h=4016&rs=1&pid=ImgDetMain',
    'https://i.pinimg.com/originals/c4/b0/e9/c4b0e964300240dd809b34bc358d9a29.jpg',
    'https://www.osiristours.com/wp-content/uploads/2016/11/valleyofqueens17.jpg',
    'https://images.memphistours.com/large/772270975_Luxor%20temple.jpg',
    'https://th.bing.com/th/id/OIP.RdjyfXTMnsZbm6WICzVSSAHaFj?rs=1&pid=ImgDetMain'
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
    '',
  ];
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => verticalSpace(10),
          itemCount: networkImagesUrl.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: ColorManager.lightBeigeColor,
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              // padding: const EdgeInsets.all(4.0),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context,AppRoutes.placeDetailsScreen);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        networkImagesUrl[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 7,
                    right: 0,
                    child: Text(
                      titles[index],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w100,
                          fontFamily: 'Cairo'),
                    ),
                  ),
                  Positioned(
                    top: 3,
                    left: 3,
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
          }),
    );
  }
}
