import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/features/allGovernorates/view/allGovernorates_screen.dart';
import 'package:tour_guide/features/home/view/widgets/auto_scrolling.dart';
import 'package:tour_guide/features/home/view/widgets/famous_places.dart';
import 'package:tour_guide/features/home/view/widgets/nearst_places.dart';
import 'package:tour_guide/features/home/view/widgets/promote_places.dart';
import 'package:tour_guide/features/home/view/widgets/titles.dart';
import 'package:tour_guide/features/layout/view/widgets/custom_appBar.dart';
import '../../../core/utils/text_styles.dart';

/*class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: CustomAppbar()),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SliderWidget(),
                SizedBox(height: 15.h),
                Titles(title: 'ماذا حولك؟؟'),
                SizedBox(height: 15.h),
                NearestPlaces(),
                SizedBox(height: 15.h),
                Row(

                  children: [
                    Titles(title: 'أشهر المحافظات السياحية'),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>allGovernorates_screen()), );
                        },
                        child: Text(
                          "عرض الكل",
                          style: TextStyles.font14DarkOrangeBold.copyWith( decoration: TextDecoration.underline,decorationColor: ColorManager.darkOrangeColor),

                        )),
                  ],
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  height: 120.h,
                  child: PromotedPlaces(),
                ),
                SizedBox(height: 15.h),
                Titles(title: 'أكثر المعالم ترويجًا'),
                SizedBox(height: 15.h),
                FamousPlaces(),
              ],
            ),
          ),
        ));
  }
}*/

/*class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> governorates = [];

  @override
  void initState() {
    super.initState();
    fetchGovernorates();
  }

  Future<void> fetchGovernorates() async {
    final response = await Supabase.instance.client
        .from('places')
        .select('name, image_url');

    setState(() {
      governorates = List<Map<String, dynamic>>.from(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: CustomAppbar()),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SliderWidget(),
                SizedBox(height: 15.h),
                Titles(title: 'ماذا حولك؟؟'),
                SizedBox(height: 15.h),
                NearestPlaces(),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Titles(title: 'أشهر المحافظات السياحية'),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      allGovernorates_screen()));
                        },
                        child: Text(
                          "عرض الكل",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
                SizedBox(height: 15.h),
                governorates.isEmpty
                    ? CircularProgressIndicator()
                    : PromotedPlaces(governorates: governorates),
                SizedBox(height: 15.h),
                Titles(title: 'أكثر المعالم ترويجًا'),
                SizedBox(height: 15.h),
                FamousPlaces(),
              ],
            ),
          ),
        ));
  }
}*/




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: CustomAppbar(),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SliderWidget(),
              SizedBox(height: 15.h),
              Titles(title: 'ماذا حولك؟؟'),
              SizedBox(height: 15.h),
              NearestPlaces(), // ← لو وقفته، سطره هنا يتعلق فقط بالعرض
              SizedBox(height: 15.h),
              Row(
                children: [
                  Titles(title: 'أشهر المحافظات السياحية'),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => allGovernorates_screen()),
                      );
                    },
                    child: Text(
                      "عرض الكل",
                      style: TextStyles.font14DarkOrangeBold.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: ColorManager.darkOrangeColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 120.h,
                child: const PromotedPlaces(), // ← النسخة المعدّلة لربط البيانات من Supabase
              ),
              SizedBox(height: 15.h),
              Titles(title: 'أكثر المعالم ترويجًا'),
              SizedBox(height: 15.h),
              FamousPlaces(),
            ],
          ),
        ),
      ),
    );
  }
}
