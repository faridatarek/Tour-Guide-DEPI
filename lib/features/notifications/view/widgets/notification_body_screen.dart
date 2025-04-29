import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';

class NotificationBodyScreen extends StatelessWidget {
  const NotificationBodyScreen({super.key});
  final List<String> images = const [
    'https://th.bing.com/th/id/R.3875c252f986a546da9fc82c0e33d26e?rik=yEhFTAiyjfzzeQ&pid=ImgRaw&r=0',
    'https://egyptiangeographic.com/uploads/files/egyptiangeographic.com_1605356917_1.jpg',
    'https://th.bing.com/th/id/R.b6da499dbdb8db4c99e0e3f085fc44dd?rik=2BF6UjFMrvh0UA&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/OIP.P--0-iz2JO90jEXmoIetpAHaE8?w=6016&h=4016&rs=1&pid=ImgDetMain',
    'https://i.pinimg.com/originals/c4/b0/e9/c4b0e964300240dd809b34bc358d9a29.jpg',
    'https://www.osiristours.com/wp-content/uploads/2016/11/valleyofqueens17.jpg',
  ];
  final List<String> titles = const [
    'معبد الكرنك ',
    'مسجد أبي الحجاج ',
    'دير مارجرجس ',
    'مقابر النبلاء',
    'تمثالا ممنون ',
    'وادي الملوك ',
  ];
  final List<String> subtitles = const [
    ' 6 يوينو الساعة 3 مساء',
    '5 يونيو الساعة 5 مساء',
    '8 يونيو الساعة 11صباحا',
    '6 يونيو   الساعة 6 مساء',
    '5 يونيو الساعة 5 مساء',
    '8 يونيو الساعة 11صباحا',
  ];
  final List<String> traillings = const [
    'متبقي 3 ساعات ',
    'متبقي 6 ساعات ',
    'تمت الزيارة',
    'تمت الزيارة',
    'تمت الزيارة',
    'تمت الزيارة',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                width: double.infinity,
                height: 90.h,
                decoration: BoxDecoration(
                  color: ColorManager.beigeColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: SizedBox(
                  height: 85.h,
                  width: 120.w,
                  child: InkWell(
                    onTap: () {
                    },
                    child: ListTile(
                      leading: Container(
                        width: 70.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(titles[index]),
                      titleTextStyle: TextStyles.font18Brown2ExtraBold,
                      subtitle: Text(subtitles[index]),
                      subtitleTextStyle: TextStyles.font10greyMedium,
                      trailing: Text(
                        traillings[index],
                        style: traillings[index] != 'تمت الزيارة'
                            ? TextStyles.font14DarkOrangeMedium
                            : TextStyles.font14BrownMedium,
                      ),
                    ),
                  ),
                ),
              ),
              childCount: titles.length,
            ),
          )
        ],
      ),
    );
  }
}
