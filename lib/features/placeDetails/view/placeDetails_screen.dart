import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/utils/color_manager.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkOrangeColor,
      body:
      Column(
        children: [
          Stack(children: [
            Image.network("https://th.bing.com/th/id/OIP.jGXGgIkz9MfkaCjJymHyWgHaE8?rs=1&pid=ImgDetMain")
            ,Positioned(
                bottom: 0,right: 0,
                child: Container(height: 50.h,width: 200.w,child: Center(child: Text("معبد الكرنك",style: TextStyle(color: Colors.white,fontSize: 25)
                  ,textDirection: TextDirection.rtl,)),
                  decoration: BoxDecoration(color: ColorManager.darkOrangeColor,borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12))),)),

          ],),
          Expanded(child:
          Container(width: MediaQuery.of(context).size.width, decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(15)))
            ,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'المحافظة: ',
                        style: TextStyle(color: ColorManager.brownColor, fontSize:20.sp,fontWeight: FontWeight.w800),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'محافظة الأقصر',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:18.sp,
                              color:ColorManager.brownColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'المنطقة: ',
                        style: TextStyle(color: ColorManager.brownColor, fontSize:20.sp,fontWeight: FontWeight.w800),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'الأقصر',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:18.sp,
                              color:ColorManager.brownColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(textDirection: TextDirection.rtl,
                      text: TextSpan(
                        text: 'العنوان: ',
                        style: TextStyle(color: ColorManager.brownColor, fontSize:20.sp,fontWeight: FontWeight.w800),
                        children: <TextSpan>[
                          TextSpan(

                            text: 'يقع معبد الكرنك في غربي "طيبة" الي الشمال من معبد الأقصر بنحو ثلاث كيلو مترات',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:18.sp,
                              color:ColorManager.brownColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'متاح للزيارة: ',
                        style: TextStyle(color: ColorManager.brownColor, fontSize:20.sp,fontWeight: FontWeight.w800),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'نعم',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:18.sp,
                              color:ColorManager.brownColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'مواعيد الزيارة: ',
                        style: TextStyle(color: ColorManager.brownColor, fontSize:20.sp,fontWeight: FontWeight.w800),
                        children: <TextSpan>[
                          TextSpan(
                            text: '7 صباحا - 8 مساءا',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:18.sp,
                              color:ColorManager.brownColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'سعر التذكرة: ',
                        style: TextStyle(color: ColorManager.brownColor, fontSize:20.sp,fontWeight: FontWeight.w800),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'مصري (30 جنية) - اجنبي (300 جنية)',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:18.sp,
                              color:ColorManager.brownColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(textDirection: TextDirection.rtl,
                      text: TextSpan(
                        text: 'تفاصيل المكان:\n ',
                        style: TextStyle(color: ColorManager.brownColor, fontSize:20.sp,fontWeight: FontWeight.w800),
                        children: <TextSpan>[
                          TextSpan(

                            text: 'معبد الكرنك يُعد من أعظم المعابد في تاريخ مصر القديمة، وهو أكبر مجمع ديني قديم عرفه العالم، بُني على مدار أكثر من 2000 سنة بمشاركة ملوك الفراعنة المتعاقبين، ويُعتبر مركزًا رئيسيًا لعبادة الإله آمون رع وزوجته موت وابنهما خونسو، وهم "يشكلون ثالوث طيبة المقدس"  ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:18.sp,
                              color:ColorManager.brownColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    Row(
                      children: [
                        Image.asset("name"),
                        Text("data",style: TextStyle(color: ColorManager.brownColor, fontSize:20.sp,fontWeight: FontWeight.w800),
                        ),
                      ],
                    )
                  ],
              ),
            ),))



        ],

      ),
    );

  }
}

